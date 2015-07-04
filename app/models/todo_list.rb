class TodoList < ActiveRecord::Base
  belongs_to :mouse
  STATUS = {"Cancel" => "K", "Doing" => "D", "Finish" => "F"}
  OPERATION = {"Sacrifice" => "S", "Mate" => "M", "Breed" => "B", "Identify" => "I", "Experiment" => "E" }
  def operation_lable 
    TodoList::OPERATION.invert[self.operation]
  end
  def status_lable 
    TodoList::STATUS.invert[self.status]
  end
end
