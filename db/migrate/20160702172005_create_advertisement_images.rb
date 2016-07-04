class CreateAdvertisementImages < ActiveRecord::Migration
  def change
    create_table :advertisement_images do |t|
      t.integer :advertisement_id
      t.attachment :image

      t.timestamps null: false
    end
  end
end
