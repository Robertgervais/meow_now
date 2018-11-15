class CreateBallotEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :ballot_emails do |t|
    	t.integer :ballot_id
    end
  end
end
