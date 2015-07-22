class AddReportToStrains < ActiveRecord::Migration
  def change
    add_column :strains, :attached_file_name, :string
    add_column :strains, :attached_content_type, :string
    add_column :strains, :attached_file_size, :string
    add_column :strains, :attached_updated_at, :datetime
  end
end
