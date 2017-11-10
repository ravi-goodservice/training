class Cart < ActiveRecord::Base
  belongs_to :products
  belongs_to :sellers
end
