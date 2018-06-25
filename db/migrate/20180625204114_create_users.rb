class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password_digest
      t.datetime :created_at
      t.boolean :admin
      t.string :membership

      t.timestamps
    end
  end
end
