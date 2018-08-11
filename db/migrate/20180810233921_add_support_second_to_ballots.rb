class AddSupportSecondToBallots < ActiveRecord::Migration[5.1]
  def change
    add_column :ballots, :support_second, :string
  end
end
