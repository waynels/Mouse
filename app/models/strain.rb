class Strain < ActiveRecord::Base
  has_many :mice
  belongs_to :genetic_type
  has_many :genes
  has_and_belongs_to_many :genes, :join_table => "strains_genes", :foreign_key => "strain_id"
  STATUS = {"Active" => "A", "Discarded" => "D", "Frozen" => "F"}
  def status_lable 
    Strain::STATUS.invert[self.status]
  end

  def strain_coat_color 
    color_arr = self.coat_color.split(",")
  end
end
