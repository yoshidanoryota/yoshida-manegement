class CreateOuts < ActiveRecord::Migration[6.0]
  def change
    create_table :outs do |t|

      t.timestamps
    end
  end
end
