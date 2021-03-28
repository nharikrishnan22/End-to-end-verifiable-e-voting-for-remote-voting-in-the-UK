class ChangeColumns3 < ActiveRecord::Migration[6.0]
  def change
    change_column :tallyverifications, :g1_y, :string
  end
end
