class Strain < ActiveRecord::Base
  has_many :mice
  has_and_belongs_to_many :genes, :join_table => "strains_genes", :foreign_key => "strain_id"

end
