class CreateHeaderImages < ActiveRecord::Migration
  def change
    create_table :header_images do |t|
      t.integer :header_id
      t.attachment :image

      t.timestamps null: false
    end
  end
end
