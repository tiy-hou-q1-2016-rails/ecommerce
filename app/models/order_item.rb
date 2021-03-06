class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  def total_price
    quantity * price
  end
end
