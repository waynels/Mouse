class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
      t.integer :mouse_id
      t.string :operation
      t.text :description
      t.string :status 
      t.timestamps

    end
  end
end
