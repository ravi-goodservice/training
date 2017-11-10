class OrdercartController < ApplicationController
  def view_cart
    @cart_item
    if Ordercart.where(:users_id => current_user.id).empty?
      @cart_item =''
    else
      @cart_item =UserCart.where(:ordercarts_id =>Ordercart.where(:users_id => current_user.id)[0])
    end
  end
end
