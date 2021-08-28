class CreateOuts < ActiveRecord::Migration[6.0]
  def change
    create_table :outs do |t|

      t.references :user,          null: false, foreign_key: true
      t.integer :off_id,      null: false
      t.float :extra_id
      t.date :out_day,  null: false

      t.timestamps
    end
  end
end
