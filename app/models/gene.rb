class Gene < ActiveRecord::Base
  has_many :alleles
  has_and_belongs_to_many :strains, :join_table => "strains_genes", :foreign_key => "gene_id"
end
