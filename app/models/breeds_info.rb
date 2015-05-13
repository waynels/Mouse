class BreedsInfo < ActiveRecord::Base
  belongs_to :breed 
  belongs_to :batch
  belongs_to :user, :foreign_key => "operation_by" , :class_name => "User"
end
