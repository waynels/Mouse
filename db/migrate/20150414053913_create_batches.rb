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
    create_table :operation do |t|
      t.belongs_to :strain
      t.string :operate_type
      t.integer :old_basket
      t.integer :new_basket
      t.integer :operate_by
      t.integer :operate_at
      t.text :remark
      t.timestamps null: false
    end
  end
end
