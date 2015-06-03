class CreateFrameworks < ActiveRecord::Migration
  def change
    create_table :frameworks do |t|
      t.string :code
      t.integer :axis_y
      t.integer :axis_x
      t.timestamps null: false
    end
  end
end
