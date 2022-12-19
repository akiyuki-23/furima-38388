class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id, :user_id
  
  with_options presence: true do
    validates: user_id
    validates: item_id
    validates: city
    validates: address
    validates: postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates: phone_number, format: {with: /\A\d{10}$|^\d{11}\z/}
  end
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
  
end