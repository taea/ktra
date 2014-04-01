class Week < ActiveRecord::Base
  #attr_accessible :end_date, :start_date
  has_many :tasks
  def self.current
    time = Time.now
    self.where(start_date: time.in_time_zone.beginning_of_week.to_date)
      .where(end_date: time.in_time_zone.end_of_week.to_date)
      .first_or_create!
  end

  def total_point(current_user)
    self.tasks.owned_by(current_user).sum(:point)
  end
end
