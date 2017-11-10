class UserCartController < ApplicationController
  def show
  end

  def add_to_cart
    puts params[:product_id]
    product_id = params[:product_id]
    render json: {message: UserCart.create_cart(product_id,current_user)}
  end
end
