class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :item_id, :order_id, :user_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number

  # トークンのバリデーション
  validates :token, presence: true

  # アクティブハッシュのバリデーション
  with_options numericality: { other_than: 1 } do
    validates :prefecture_id
  end

  # 住所バリデーション
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: /\A\d{3}-\d{4}\z/, message: 'の保存にはハイフンが必要です。' }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{11}\z/, message: '電話番号は11桁以内で入力してさい。' }
    validates :phone_number, numericality: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
  end

  def save
    # 購入情報を保存
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所情報を保存
    Address.create(building: building, postcode: postcode, city: city, prefecture_id: prefecture_id, block: block,
                   phone_number: phone_number, order_id: order.id)
  end
end
