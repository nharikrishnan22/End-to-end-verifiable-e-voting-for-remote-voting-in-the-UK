class CreateAuditverifications < ActiveRecord::Migration[6.0]
  def change
    create_table :auditverifications do |t|
      t.string :big_ri
      t.string :big_zi
      t.string :g1_x
      t.string :g1_y
      t.string :g2_x
      t.string :g2_y
      t.integer :vote
      t.string :ri

      t.timestamps
    end
  end
end
