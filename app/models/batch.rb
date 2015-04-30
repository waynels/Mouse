class Batch < ActiveRecord::Base
  belongs_to :breed
  belongs_to :basket
  has_many :mice, :foreign_key => "batch_id", :class_name => "Mouse"
  belongs_to :father, :foreign_key => "father_id", :class_name => "Mouse"
  belongs_to :mother, :foreign_key => "mother_id", :class_name => "Mouse"
end
