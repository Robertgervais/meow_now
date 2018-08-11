class AddSupportFirstToBallots < ActiveRecord::Migration[5.1]
  def change
    add_column :ballots, :support_first, :string
  end
end
