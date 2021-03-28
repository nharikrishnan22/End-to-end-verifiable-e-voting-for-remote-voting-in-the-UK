class CreateTallyverifications < ActiveRecord::Migration[6.0]
  def change
    create_table :tallyverifications do |t|
      t.integer :g1_x
      t.integer :g1_y
      t.integer :g2_x
      t.integer :g2_y
      t.integer :s
      t.integer :t

      t.timestamps
    end
  end
end
