class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :shipping_address

  def sold_out?
    Order.exists?(item_id: id)
  end
end
