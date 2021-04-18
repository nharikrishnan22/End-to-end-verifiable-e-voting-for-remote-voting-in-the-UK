class AddColumnsToWellFormednessVerification < ActiveRecord::Migration[6.0]
  def change
    add_column :wellformednessverifications, :big_ri, :string
    add_column :wellformednessverifications, :big_zi, :string
    add_column :wellformednessverifications, :g1_x, :string
    add_column :wellformednessverifications, :g1_y, :string
    add_column :wellformednessverifications, :g2_x, :string
    add_column :wellformednessverifications, :g2_y, :string
  end
end
