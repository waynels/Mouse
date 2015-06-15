class CreateGenes < ActiveRecord::Migration
  def change
    create_table :genes do |t|
      t.string :name
      t.string :short_name
      t.integer :access_id
      t.string :location

      t.timestamps null: false
    end
  end
end
