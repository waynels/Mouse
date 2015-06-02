class CreateFrameworks < ActiveRecord::Migration
  def change
    create_table :frameworks do |t|
      t.string :code

      t.timestamps null: false
    end
  end
end
