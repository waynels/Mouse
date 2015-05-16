class CreateOperations < ActiveRecord::Migration
  def change
    create_table :operations do |t|
      t.belongs_to :strain
      t.integer :mouse_id
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
