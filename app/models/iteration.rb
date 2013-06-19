class Iteration < ActiveRecord::Base
  attr_accessible :end_date, :start_date
  has_many :tasks, :conditions => { :status => 'done' }
end
