class CreateNewUsers < ActiveRecord::Migration
  def change
    create_table :new_users do |t|
      t.string :phone
      t.string :otp

      t.timestamps null: false
    end
  end
end
