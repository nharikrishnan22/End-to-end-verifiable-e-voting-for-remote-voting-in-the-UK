class AddDigestToVotes < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :digest, :string
  end
end
