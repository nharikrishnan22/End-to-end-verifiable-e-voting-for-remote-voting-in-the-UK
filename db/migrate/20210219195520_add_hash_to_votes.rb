class AddHashToVotes < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :hash, :string
  end
end
