class AddColumnVoteToVotes < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :vote, :integer
  end
end
