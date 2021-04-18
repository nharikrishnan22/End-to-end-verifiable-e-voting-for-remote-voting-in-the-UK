class AddMoreColumnsToWellFormednessVerification < ActiveRecord::Migration[6.0]
  def change
    remove_column :wellformednessverifications, :big_ri, :string
    remove_column :wellformednessverifications, :big_zi, :string
    add_column :wellformednessverifications, :big_ri_x, :string
    add_column :wellformednessverifications, :big_ri_y, :string
    add_column :wellformednessverifications, :big_zi_x, :string
    add_column :wellformednessverifications, :big_zi_y, :string
  end
end
