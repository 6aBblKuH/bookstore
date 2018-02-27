class Order < ApplicationRecord
  belongs_to :user
  has_many :addresses, as: :addressable, dependent: :destroy
  has_many :order_items
  has_one :coupon
  enum state: ['Waiting for processing', 'In delivery', 'Delivered', 'Canceled']
  scope :in_progress, -> { where(state: 0) }
end
