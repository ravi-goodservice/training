class Product < ActiveRecord::Base
  searchable do
    text :name, :description
  end
  validates :name, presence: true
  validates :description, presence: true
  def self.check_seller(user_id)  #cheking seller and allow only seller to create product
    if Seller.find_by_users_id(user_id) != nil
      return true
    else
      return false
    end
  end
end