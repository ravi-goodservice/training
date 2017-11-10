class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.references :users, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
