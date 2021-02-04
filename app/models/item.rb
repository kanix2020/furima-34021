class Item < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :description
    validates :price
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
    validates :price, numericality: { greater_than_or_equal_to: 300, message: 'は300以上の数値で入力してください' }
    validates :price, numericality: { less_than_or_equal_to: 9_999_999, message: 'は9,999,999以下の数値で入力してください' }
    validates :image
  end

  belongs_to :user
  has_one    :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :delivery_price
  belongs_to :prefecture
  belongs_to :delivery_day

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :item_state_id
    validates :delivery_price_id
    validates :prefecture_id
    validates :delivery_day_id
  end
end
