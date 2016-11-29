class CreateMailNeeders < ActiveRecord::Migration
  def change
    create_table :mail_needers do |t|
      t.string :email

      t.timestamps null: false
    end
  end
end
