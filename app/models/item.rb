class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image


  with_options presence: true do 
  validates :product_name
  validates :description
  validates :category_id
  validates :status_id
  validates :burden_id
  validates :delivery_id
  validates :days_delivery_id
  validates :price
  end

  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :delivery
  belongs_to :days_delivery

  with_options numericality: { other_than: 1, message: "can't be blank" } do
  validates :category_id
  validates :status_id
  validates :burden_id
  validates :delivery_id
  validates :days_delivery_id
end
end

