class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :products, index: true, foreign_key: true
      t.references :sellers, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
