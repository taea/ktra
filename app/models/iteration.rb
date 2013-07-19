class Iteration < ActiveRecord::Base
  attr_accessible :end_date, :start_date
  has_many :tasks
  def self.for_week(w=0)
    time = Time.now + w.week
    self.where(start_date: time.in_time_zone.beginning_of_week.to_date)
      .where(end_date: time.in_time_zone.end_of_week.to_date)
      .first_or_create
  end
end
