class OrderShipping
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'はハイフンを含む半角数字で入力して下さい' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁以上11桁以内の半角数字で入力して下さい' }
    validates :token
  end

  def save
    order = Order.create(user_id:, item_id:)
    return unless order.persisted?

    ShippingAddress.create(
      order_id: order.id,
      postal_code:,
      prefecture_id:,
      city:,
      addresses:,
      building:,
      phone_number:
    )
  end
end
