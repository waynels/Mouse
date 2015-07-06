class AddBreedMouse < ActiveRecord::Migration
  def change
    add_column :mice, :breed_id, :integer
    remove_column :baskets, :cage_type
    change_table :baskets do |t|
      t.string :cage_type, :default => "S"
    end
  end
end
