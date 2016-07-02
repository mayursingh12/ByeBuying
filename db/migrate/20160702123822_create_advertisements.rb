class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.string :title
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.float :per_hour_cost
      t.string :contact
      t.string :email
      t.integer :category_id
      t.integer :subcategory_id

      t.timestamps null: false
    end
  end
end
