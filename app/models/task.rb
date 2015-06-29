class Task < ActiveRecord::Base
  has_many :sub_tasks, :class_name => "Task", :foreign_key => "parent_id"
  belongs_to :list

end
