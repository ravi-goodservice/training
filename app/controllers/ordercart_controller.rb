class OrdercartController < ApplicationController
  before_action :authenticate_user!
  def view_cart   #view cart
    @products_array =[]
    if Ordercart.where(:users_id => current_user.id).empty?
      @cart_item =''
    else
      @cart_item =UserCart.where(:ordercarts_id =>Ordercart.where(:users_id => current_user.id)[0])
      @cart_item.product.each do |item|
        @products_array << Product.find(item[0].products_id)
      end
    end

  end
end
