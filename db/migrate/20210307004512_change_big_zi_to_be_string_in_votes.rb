class ChangeBigZiToBeStringInVotes < ActiveRecord::Migration[6.0]
  def change
    change_column :votes, :big_zi, :string
  end
end
