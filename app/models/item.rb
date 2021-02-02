class Item < ApplicationRecord

  with_options presence: true do
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates :title
    validates :description
    validates :price
  end

  belongs_to :user
  has_one    :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :delivery_price
  belongs_to :prefecture
  belongs_to :delivery_day

  # with_options numericality: { other_than: 1 } do
  validates :category_id, numericality: { other_than: 1 } 
  validates :item_state_id, numericality: { other_than: 1 } 
  validates :delivery_price_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :delivery_day_id, numericality: { other_than: 1 } 
  # end

end
