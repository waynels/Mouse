class Breed < ActiveRecord::Base
  belongs_to :father, :foreign_key => "father_id", :class_name => "Mouse"
  belongs_to :mother, :foreign_key => "mother_id", :class_name => "Mouse"
  belongs_to :basket
  has_many :breeds_infos, :foreign_key => "breed_id", :class_name => "BreedsInfo"
  has_many :batches
end
