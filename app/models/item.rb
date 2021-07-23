class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :delivery
  belongs_to :days_delivery
  belongs_to :user
  has_one_attached :image


  with_options presence: true do 
  validates :product_name
  validates :image
  validates :description
  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
end
with_options numericality: { other_than: 1, message: "can't be blank" } do
  validates :category_id
  validates :status_id
  validates :burden_id
  validates :delivery_id
  validates :days_delivery_id
end
validates :price, numericality: true
end
