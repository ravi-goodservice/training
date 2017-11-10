class UserCart < ActiveRecord::Migration
  def change
    create_table :user_carts do |t|
      t.references :products, index: true, foreign_key: true
      t.references :ordercarts, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
