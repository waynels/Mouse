#encoding: utf-8
class Mouse < ActiveRecord::Base
  belongs_to :strain
  belongs_to :basket
  belongs_to :batch
  has_many :todo_lists
  has_and_belongs_to_many :alleles, :join_table => "mice_alleles", :foreign_key => "mouse_id"
  belongs_to :father_mouse, :foreign_key => "father_id", :class_name => "Mouse"
  belongs_to :mother_mouse, :foreign_key => "mother_id", :class_name => "Mouse"
  belongs_to :creator, :foreign_key => "created_by", :class_name => "User"
  belongs_to :onwer, :foreign_key => "onwer_id", :class_name => "User"
  has_many :f_breeds, :foreign_key => "mother_id" , :class_name => "Breed"
  has_many :m_breeds, :foreign_key => "father_id" , :class_name => "Breed"
  scope :alive_mice, -> {where("life_status = 'A'") } 
  scope :not_alive_mice, -> {where("life_status <> 'A'") } 
  scope :dd_mice, -> {where("life_status='DD'") } 
  scope :male_mice, -> {where("sex = 'M'") } 
  scope :female_mice, -> {where("sex = 'F' ") } 
  scope :litter_mice, -> {where("sex is NULL or sex= ''") } 
  SEXTYPE = {"雄性" => "M", "雌性" => "F"}
  LIFESTATUS = {"Alive" => "A", "Killed" => "K", "Culled" => "C", "Missing" => "M", "Unhealthy Death" => "UD", "Dysplasia Death" => "DD", "Transfer" => "T" }

  def life_status_lable 
    Mouse::LIFESTATUS.invert[self.life_status]
  end
  def mouse_show_name
     "#{self.code}[#{self.strain.common_name}]"
  end
  def can_destroy
    if (self.f_breeds.size > 0 or self.m_breeds.size > 0) or self.batch_id or self.todo_lists.size > 0
      false
    else
      true
    end
    
  end
  def mouse_age
    if self.birthday
      if self.life_status == "A"
        "#{(Date.today() - self.birthday).to_i/7}周"
      else
        if self.dead_date
          "#{(self.dead_date - self.birthday).to_i/7}周"
        else
          "未知"
        end
      end
    end
  end

  def get_life_status
    if self.sex == nil or self.sex == ""
      deadtype = { "Dysplasia Death" => "DD" }
    else
      deadtype = {"Killed" => "K", "Culled" => "C", "Missing" => "M", "Unhealthy Death" => "UD", "Transfer" => "T"}
    end
  end
  def show_sex 
    if self.sex == "M"
      return "♂"
    elsif self.sex == "F"
      return "♀"
    else
      return "-"
    end
  end
  def mouse_genes
    self.strain.genes
  end
  def is_mating
    if self.sex == "F"
      if self.f_breeds.where(is_usable: true).first
        true
      else
        false
      end
    elsif self.sex == "M"
      if self.m_breeds.where(is_usable: true).first
        true
      else
        false
      end
    else
      false
    end
  end
end
