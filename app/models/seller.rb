class Seller < ActiveRecord::Base
  belongs_to :user
  def self.makeseller(user_id)   #making seller
      if Seller.find_by_users_id(user_id) != nil
        return 'already seller'
      else
        Seller.create(:users_id=>user_id)
        return 'Created'
      end
  end
end
