class CreateReminderEmails < ActiveRecord::Migration[5.1]
  def change
    create_table :reminder_emails do |t|
      t.integer :ballot_id, null: false
      t.timestamp :next_run_at, null: false, index: true
    end
  end
end
