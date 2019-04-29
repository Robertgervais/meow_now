class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.datetime :created_at
      t.boolean :admin
      t.string :membership

      t.timestamps
    end
  end
end
