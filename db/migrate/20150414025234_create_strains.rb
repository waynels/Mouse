class CreateStrains < ActiveRecord::Migration
  def change
    create_table :strains do |t|
      t.string :former_name
      t.string :common_name
      t.integer :genetic_type_id
     # t.text :protocol
      t.string :status
      t.string :coat_color
      t.string :wean_age
      t.string :female_mature_age
      t.string :male_mature_age
      t.string :mating_system
      t.string :breeding_consideration
      t.string :source
      t.string :origin
      t.string :ref_website
      t.text :description
      t.timestamps null: false
      #t.timestamps
    end
     create_table(:strains_genes, :id => false) do |t|
      t.references :strain
      t.references :gene
    end
  end
end
