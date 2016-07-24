class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :name
      t.string :email
      t.string :mobile
      t.text :message

      t.timestamps null: false
    end
  end
end
