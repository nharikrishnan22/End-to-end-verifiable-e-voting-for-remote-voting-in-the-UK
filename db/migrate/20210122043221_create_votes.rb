class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.integer :index
      t.integer :big_ri
      t.integer :big_zi
      t.boolean :pwf
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
