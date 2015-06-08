class CreateBaskets < ActiveRecord::Migration
  def change
    create_table :baskets do |t|
      t.string :code
      t.string :cage_type
      t.belongs_to :framework
      t.integer :onwer_id

      t.timestamps null: false
    end
  end
end
