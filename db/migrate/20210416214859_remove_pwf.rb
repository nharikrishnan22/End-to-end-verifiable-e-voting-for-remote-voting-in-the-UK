class RemovePwf < ActiveRecord::Migration[6.0]
  def change
    remove_column :votes, :pwf, :boolean
  end
end
