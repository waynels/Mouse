#encoding: utf-8
class Breed < ActiveRecord::Base
  belongs_to :father, :foreign_key => "father_id", :class_name => "Mouse"
  belongs_to :mother, :foreign_key => "mother_id", :class_name => "Mouse"
  belongs_to :creator, :foreign_key => "created_by", :class_name => "User"
  belongs_to :basket
  has_many :breeds_infos, :foreign_key => "breed_id", :class_name => "BreedsInfo"
  has_many :batches
  scope :can_use_mate, -> {where("is_usable = true") } 

  def show_can_usable
    if self.is_usable
      return "<span style='color:#33CC00'>正在配对中</span>"
    else
      return "<span style='color:#CC3333'>已取消配对</span>"
    end
  end
  def mate_age
    if self.cage_at
      if self.cancel_date
        "#{(self.cancel_date - self.cage_at).to_i/7}周"
      else
        "#{(Date.today() - self.cage_at).to_i/7}周"
      end
    else
        "-"
    end
  end
end
