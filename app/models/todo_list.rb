class TodoList < ActiveRecord::Base
  belongs_to :mouse
  STATUS = { "Doing" => "D","Cancel" => "C", "Finish" => "F"}
  OPERATION = {"Sacrifice" => "S", "Mate" => "M", "Breed" => "B", "Identify" => "I", "Experiment" => "E" }
  FINISH = { "Doing" => "D", "Finish" => "F"}
  def operation_lable 
    TodoList::OPERATION.invert[self.operation]
  end
  def status_lable 
    TodoList::STATUS.invert[self.status]
  end
end
