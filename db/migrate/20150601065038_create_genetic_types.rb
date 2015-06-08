class CreateGeneticTypes < ActiveRecord::Migration
  def change
    create_table :genetic_types do |t|
      t.string :short_name
      t.string :full_name

      t.timestamps null: false
    end
  end
end
