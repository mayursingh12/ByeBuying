class CreateBlogImages < ActiveRecord::Migration
  def change
    create_table :blog_images do |t|
      t.integer :blog_id
      t.attachment :image

      t.timestamps null: false
    end
  end
end
