class CreateBaskets < ActiveRecord::Migration
  def change
    create_table :baskets do |t|
      t.string :code
      t.string :use_type

      t.timestamps null: false
    end
  end
end
