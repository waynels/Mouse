class CreateBaskets < ActiveRecord::Migration
  def change
    create_table :baskets do |t|
      t.string :code

      t.timestamps null: false
    end
  end
end
