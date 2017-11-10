class Product < ActiveRecord::Base
  searchable do
    text :name, :description
  end
  validates :name, presence: true
  validates :description, presence: true

end