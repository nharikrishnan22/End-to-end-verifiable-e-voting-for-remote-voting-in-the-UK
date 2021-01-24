class RemoveIndexFromVote < ActiveRecord::Migration[6.0]
  def change
    remove_column :votes, :index, :integer
  end
end
