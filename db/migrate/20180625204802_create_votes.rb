class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :ballot_id
      t.string :user_vote

      t.timestamps
    end
  end
end
