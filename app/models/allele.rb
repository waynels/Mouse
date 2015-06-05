class Allele < ActiveRecord::Base
  belongs_to :gene
  has_and_belongs_to_many :mice, :join_table => "mice_alleles", :foreign_key => "allele_id"

end
