class RiColumnToVotes < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :ri, :integer
  end
end
