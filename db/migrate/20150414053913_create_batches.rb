class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.integer :father_id
      t.belongs_to :basket
      t.integer :mother_id
      t.belongs_to :breed
      t.integer :quantity
      t.date :childbirthday
      t.timestamps null: false
    end
  end
end
