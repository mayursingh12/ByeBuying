class CreateHeaderImages < ActiveRecord::Migration
  def change
    create_table :header_images do |t|
      t.integer :header_id
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at

      t.timestamps null: false
    end
  end
end
