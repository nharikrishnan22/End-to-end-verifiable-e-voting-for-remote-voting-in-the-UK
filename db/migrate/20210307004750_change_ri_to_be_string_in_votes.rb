class ChangeRiToBeStringInVotes < ActiveRecord::Migration[6.0]
  def change
    change_column :votes, :ri, :string
  end
end
