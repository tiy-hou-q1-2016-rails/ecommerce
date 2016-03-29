class CheckoutController < ApplicationController

  before_action do
    if @current_user.nil?
      redirect_to sign_in_path
    end
  end

  def start
    @order = Order.find_by status: 'cart', user_id: @current_user.id
  end

  def process_payment
    @order = Order.find_by status: 'cart', user_id: @current_user.id

    # process the payment
    # if successful, redirect
    # else show start

    @order.update status: 'pending'

    redirect_to receipt_path(id: @order.id)
  end

  def receipt
    # I want a 404 if we can't find_by
    @order = Order.find_by! id: params[:id], user_id: @current_user.id
  end
end
