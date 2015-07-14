class AddCreatorToToDoList < ActiveRecord::Migration
  def change
    add_column :todo_lists, :created_by, :integer
  end
end
