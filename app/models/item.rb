class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  validates :user,            presence: true    
  validates :product_name,    presence: true
  validates :description,     presence: true
  validates :category_id,     presence: true
  validates :status_id,       presence: true
  validates :burden_id,       presence: true
  validates :delivery_id,     presence: true
  validates :days_delivery_id,presence: true
  validates :price,           presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :burden
  belongs_to :delivery
  belongs_to :days_delivery


  validates :title, :text, presence: true

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :burden_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :days_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}

end


