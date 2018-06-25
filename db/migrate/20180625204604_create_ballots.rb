class CreateBallots < ActiveRecord::Migration[5.1]
  def change
    create_table :ballots do |t|
      t.text :ballot_issue
      t.integer :user_id
      t.string :options
      t.string :ballot_type
      t.text :content
      t.datetime :expiration
      t.boolean :include_weekend

      t.timestamps
    end
  end
end
