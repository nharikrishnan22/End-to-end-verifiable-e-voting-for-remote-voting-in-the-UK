class AddPwfReplacements < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :pwf_c_1, :string
    add_column :votes, :pwf_c_2, :string
    add_column :votes, :pwf_r_1, :string
    add_column :votes, :pwf_r_2, :string
  end
end
