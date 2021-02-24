class RemoveHashToVotes < ActiveRecord::Migration[6.0]
  def change
    remove_column :votes, :hash, :string
  end
end
