class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :category_id
      t.string :gender
      t.integer :subcategory_id
      t.text :description
      t.text :technical_specification
      t.integer :state_id
      t.integer :city_id
      t.text :location
      t.datetime :start_at
      t.datetime :end_at
      t.integer :quantity
      t.string :rent
      t.float :refundable_security
      t.float :cost_of_replacement
      t.text :youtube_link
      t.text :other

      t.timestamps null: false
    end
  end
end
