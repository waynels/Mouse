class CreateBreeds < ActiveRecord::Migration
  def change
    create_table :breeds do |t|
      t.belongs_to :basket
      t.integer :father_id
      t.integer :mother_id
      t.date :cage_at
      t.boolean :is_usable

      t.timestamps null: false
    end
  end
end
