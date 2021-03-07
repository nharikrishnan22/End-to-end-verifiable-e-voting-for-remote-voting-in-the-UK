class ChangeBigRiToBeStringInVotes < ActiveRecord::Migration[6.0]
  def change
    change_column :votes, :big_ri, :string
  end
end
