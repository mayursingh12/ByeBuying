class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.integer :category_id
      t.integer :subcategory_id
      t.string :nature_of_service
      t.string :club_name
      t.string :membership_plan
      t.datetime :start_at
      t.datetime :end_at
      t.text :service_description
      t.integer :state_id
      t.integer :city_id
      t.text :location
      t.string :price_type
      t.text :youtube_link
      t.text :other
      t.float :area_in_meters
      t.text :amenities_available
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
