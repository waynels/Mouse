class Basket < ActiveRecord::Base
  has_many :mice, :foreign_key =>"id", :class_name => "Mouse"
end
