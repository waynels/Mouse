#encoding: utf-8
class Mouse < ActiveRecord::Base
  belongs_to :strain
  belongs_to :basket
  has_and_belongs_to_many :alleles, :join_table => "mice_alleles", :foreign_key => "mouse_id"
  belongs_to :father_mouse, :foreign_key => "father_id", :class_name => "Mouse"
  belongs_to :mother_mouse, :foreign_key => "mother_id", :class_name => "Mouse"
  belongs_to :creator, :foreign_key => "created_by", :class_name => "User"
  belongs_to :onwer, :foreign_key => "onwer_id", :class_name => "User"
  SEXTYPE = {"雄性" => "M", "雌性" => "F"}

  def mouse_show_name
     "#{self.gender}#{self.code}[#{self.strain.name}]"
  end
  def mouse_genes
    arr = []
    self.alleles.each do |al|
      arr << al.gene
    end
    return arr
  end
end
