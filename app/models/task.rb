class Task < ActiveRecord::Base

  validates_presence_of :title, uniqueness: true
  validates_presence_of :due_date
  
end
