class Item < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :description
    validates :price
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
