class AddConfirmedToUsers < ActiveRecord::Migration[5.1]
  def change
  	add_column :users, :confirmed, :boolean
  end
end
