class UserCartController < ApplicationController
  before_action :authenticate_user!
  def show
  end

  def add_to_cart     #add to cart by ajax
    puts params[:product_id]
    product_id = params[:product_id]
    render json: {message: UserCart.create_cart(product_id,current_user)}
  end
end
