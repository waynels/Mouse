#encoding: utf-8
class Mouse < ActiveRecord::Base
  belongs_to :strain
  belongs_to :basket
  SEXTYPE = {"男" => "M", "女" => "F"}
  
  
end
