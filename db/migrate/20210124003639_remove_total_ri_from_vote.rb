class RemoveTotalRiFromVote < ActiveRecord::Migration[6.0]
  def change
    remove_column :votes, :total_ri, :integer
  end
end
