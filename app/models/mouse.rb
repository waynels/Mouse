#encoding: utf-8
class Mouse < ActiveRecord::Base
  belongs_to :strain
  belongs_to :basket
  has_many :todo_lists
  has_and_belongs_to_many :alleles, :join_table => "mice_alleles", :foreign_key => "mouse_id"
  belongs_to :father_mouse, :foreign_key => "father_id", :class_name => "Mouse"
  belongs_to :mother_mouse, :foreign_key => "mother_id", :class_name => "Mouse"
  belongs_to :creator, :foreign_key => "created_by", :class_name => "User"
  belongs_to :onwer, :foreign_key => "onwer_id", :class_name => "User"
  has_many :f_breeds, :foreign_key => "mother_id" , :class_name => "Breed"
  has_many :m_breeds, :foreign_key => "father_id" , :class_name => "Breed"
  belongs_to :breed
  scope :alive_mice, -> {where("life_status = 'A'") } 
  scope :not_alive_mice, -> {where("life_status <> 'A'") } 
  scope :male_mice, -> {where("sex = 'M'") } 
  scope :female_mice, -> {where("sex = 'F' ") } 
  scope :litter_mice, -> {where("sex is NULL or sex= ''") } 
  SEXTYPE = {"雄性" => "M", "雌性" => "F"}
  LIFESTATUS = {"Alive" => "A", "Killed" => "K", "Culled" => "C", "Missing" => "M", "Unhealthy Death" => "UD", "Dysplasia Death" => "DD" }

  def life_status_lable 
    Mouse::LIFESTATUS.invert[self.life_status]
  end
  def mouse_show_name
     "#{self.code}[#{self.strain.common_name}]"
  end

  def get_life_status
    if self.sex == nil or self.sex == ""
      deadtype = { "Dysplasia Death" => "DD" }
    else
      deadtype = {"Killed" => "K", "Culled" => "C", "Missing" => "M", "Unhealthy Death" => "UD"}
    end
  end
  def show_sex 
    if self.sex == "M"
      return "♂"
    elsif self.sex == "F"
      return "♀"
    end
  end
  def mouse_genes
    self.strain.genes
  end
end
