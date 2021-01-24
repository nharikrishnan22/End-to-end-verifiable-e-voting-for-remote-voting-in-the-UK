class AddTotalRiVotes < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :total_ri, :integer
  end
end
