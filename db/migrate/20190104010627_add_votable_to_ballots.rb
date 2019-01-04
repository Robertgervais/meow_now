class AddVotableToBallots < ActiveRecord::Migration[5.1]
  def change
    add_column :ballots, :votable, :boolean
  end
end
