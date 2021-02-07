class Address < ApplicationRecord
  # with_options presence: true do
  #   validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/, message: '郵便番号の保存にはハイフンが必要です。' }
  #   validates :prefecture_id
  #   validates :city
  #   validates :block
  #   validates :phone_number, numericality: { with: /\A\d{11}\z/, message: '電話番号は11桁以内の半角数値で入力してさい' }
  # end
  # validates :building

  belongs_to :order
end
