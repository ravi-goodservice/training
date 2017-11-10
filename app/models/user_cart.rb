class UserCart < ActiveRecord::Base
  belongs_to :products
  belongs_to :users
  belongs_to :ordercarts

  def self.create_cart(product_id,current_user)
    @currentUser = current_user.id
    puts @currentUser
    #checking already added in the cart or not

    if UserCart.where(:products_id => product_id, :users_id => current_user.id).empty?
      #inserting product into the table
      if Ordercart.where(:users_id => current_user.id).empty?
        cart=Ordercart.create(:users_id => current_user.id)
      else
        cart=Ordercart.where(:users_id => current_user.id)[0]
      end
      UserCart.create(:products_id => product_id, :users_id => current_user.id, :ordercarts_id => cart.id)
      return 'Successfully added into the cart'
    else
      return 'Already added into the cart'
    end
  end
end