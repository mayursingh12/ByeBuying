class CreateServiceImages < ActiveRecord::Migration
  def change
    create_table :service_images do |t|
      t.integer :service_id
      t.attachment :image
      t.datetime :deleted_at

      t.timestamps null: false
    end
  end
end
