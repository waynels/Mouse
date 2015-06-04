class CreateAlleles < ActiveRecord::Migration
  def change
    create_table :alleles do |t|
      t.belongs_to :gene
      t.string :name

      t.timestamps null: false
    end
     create_table(:mice_alleles, :id => false) do |t|
      t.references :mouse
      t.references :alele
    end
  end
end
