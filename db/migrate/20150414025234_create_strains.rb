class CreateStrains < ActiveRecord::Migration
  def change
    create_table :strains do |t|
      t.string :name
      t.text :description


      t.timestamps null: false
      #t.timestamps
    end
  end
end
