class CartsController < ApplicationController

  before_action do
    if @current_user.nil?
      redirect_to sign_in_path
    end
  end

  def remove_from_cart
    order = Order.find_by status: 'cart', user_id: @current_user.id
    @product = Product.find_by id: params[:product_id]
    
    # how do I find the order_item
    order_item = OrderItem.find_by order_id: order.id, product_id: @product.id
    order_item.destroy

    redirect_to cart_path
  end

  def add_to_cart

    # what goes here
    # your cart is what is building your order

    @product = Product.find_by id: params[:product_id]

    # get the order

    # make order in the session
    # order = Order.find_by id: session[:order_id]
    # (but we want the order to show if we sign in to our phone after adding on our laptop)

    order = Order.find_by status: 'cart', user_id: @current_user.id

    if order.nil?
      order = Order.new
      order.user = @current_user
      order.purchased_at = Time.now
      order.save!
    end

    # if we already have an order item for this order / product
    order_item = OrderItem.find_by order_id: order.id, product_id: @product.id
    if order_item.present?
      # increment quantity
      order_item.quantity = order_item.quantity + 1
    else
      # do what we did
      order_item = OrderItem.new
      order_item.order = order
      order_item.product = @product # what do I replace this with? It's nil
      order_item.price = @product.price
      order_item.shipping_cost = 0
      order_item.quantity = 1
    end
    order_item.save!

    # this was a POST, so we need to redirect somewhere
    redirect_to cart_path

  end

  def view

    @order = Order.find_by status: 'cart', user_id: @current_user.id

  end
end
