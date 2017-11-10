class UserCart < ActiveRecord::Base
  belongs_to :products
  belongs_to :ordercarts

  def self.create_cart(product_id,current_user)
    @currentUser = current_user.id
    puts @currentUser
    #checking already added in the cart or not
    if Ordercart.where(:users_id => current_user.id).empty?       #checking cart for user
      cart=Ordercart.create(:users_id => current_user.id)
    else
      cart=Ordercart.where(:users_id => current_user.id)[0]
    end
    if UserCart.where(:products_id => product_id, :ordercarts_id => cart.id).empty?     #cheking product in cart for product
      UserCart.create(:products_id => product_id, :ordercarts_id => cart.id)
      return 'Successfully added into the cart'
    else
      return 'Already added into the cart'
    end
  end
end