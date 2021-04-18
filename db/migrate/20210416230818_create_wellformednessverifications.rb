class CreateWellformednessverifications < ActiveRecord::Migration[6.0]
  def change
    create_table :wellformednessverifications do |t|
      t.string :c_1
      t.string :c_2
      t.string :r_1
      t.string :r_2

      t.timestamps
    end
  end
end
