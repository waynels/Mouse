#encoding: utf-8
class Basket < ActiveRecord::Base
  belongs_to :framework
  belongs_to :onwer, :foreign_key => "onwer_id", :class_name => "User"
  has_many :mice, :foreign_key =>"basket_id", :class_name => "Mouse"
  BASKETTYPE = {"Mating" => "M", "Stock" => "S","Breeding" => "B","Experiment" => "E"}
  def basket_type_label
    Basket::BASKETTYPE.invert[self.use_type]
  end
  def count_mice_in_basket 
     "#{self.code}[#{self.basket_type_label}][#{self.mice.size}]只"
  end
end
