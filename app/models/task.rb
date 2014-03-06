class Task < ActiveRecord::Base
  attr_accessible :finished_at, :memo, :point, :started_at, :status, :title, :iteration_id
  validates_presence_of :user_id, :title
  belongs_to :user
  scope :active, where(status: ['unstarted', 'doing']).order("status ASC, updated_at DESC")
end
