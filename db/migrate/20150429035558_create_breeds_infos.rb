class CreateBreedsInfos < ActiveRecord::Migration
  def change
    create_table :breeds_infos do |t|
      t.belongs_to :breed
      t.belongs_to :batch
      t.string :operation_type
      t.integer :operation_by
      t.date :operation_at
      t.integer :quantity
      t.text :remark

      t.timestamps null: false
    end
    add_column :batches, :use_val, :integer
  end
end
