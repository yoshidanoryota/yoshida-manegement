class CreateRests < ActiveRecord::Migration[6.0]
  def change
    create_table :rests do |t|

      t.timestamps
    end
  end
end
