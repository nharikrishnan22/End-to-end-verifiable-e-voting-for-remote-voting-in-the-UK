class ChangeColumns < ActiveRecord::Migration[6.0]
  def change
    change_column :tallyverifications, :g1_x, :string
    change_column :tallyverifications, :g2_x, :string
    change_column :tallyverifications, :g2_y, :string
    change_column :tallyverifications, :s, :string
    change_column :tallyverifications, :t, :string
  end
end
