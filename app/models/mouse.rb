#encoding: utf-8
class Mouse < ActiveRecord::Base
  belongs_to :strain
  belongs_to :basket
  belongs_to :father_mouse, :foreign_key => "father_id", :class_name => "Mouse"
  belongs_to :mother_mouse, :foreign_key => "mother_id", :class_name => "Mouse"
  SEXTYPE = {"男" => "M", "女" => "F"}
  
  
end
