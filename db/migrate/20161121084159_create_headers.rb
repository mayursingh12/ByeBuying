class CreateHeaders < ActiveRecord::Migration
  def change
    create_table :headers do |t|
      t.string :title
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.float :per_hour_cost
      t.integer :category_id
      t.integer :subcategory_id
      t.boolean :ready_for_post
      t.boolean :admin_verified
      t.integer :user_id
      t.text :redirect_link
      t.integer :position

      t.timestamps null: false
    end
  end
end
