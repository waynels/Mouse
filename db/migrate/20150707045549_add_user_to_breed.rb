class AddUserToBreed < ActiveRecord::Migration
  def change
    add_column :breeds, :created_by, :integer
    add_column :breeds, :breeding, :boolean, :default => false
  end
end
