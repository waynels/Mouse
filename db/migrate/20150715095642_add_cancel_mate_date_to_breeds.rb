class AddCancelMateDateToBreeds < ActiveRecord::Migration
  def change
    add_column :breeds, :cancel_date, :date
  end
end
