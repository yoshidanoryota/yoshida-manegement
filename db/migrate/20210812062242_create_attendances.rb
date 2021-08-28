class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|

      t.references :user,          null: false, foreign_key: true
      t.integer :arrive_id,      null: false
      t.float :flying_id
      t.date :attendance_day,  null: false

      t.timestamps
    end
  end
end
