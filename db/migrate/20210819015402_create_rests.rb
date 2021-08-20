class CreateRests < ActiveRecord::Migration[6.0]
  def change
    create_table :rests do |t|

      t.references :user,          null: false, foreign_key: true
      t.integer :holiday_id,      null: false
      t.date :rest_day,  null: false

      t.timestamps
    end
  end
end
