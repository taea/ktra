class Task < ActiveRecord::Base
  validates_presence_of :user_id, :title
  belongs_to :user
  scope :active, -> { where(status: ['unstarted', 'doing']).order("status ASC, updated_at DESC") }
  POINTS = %w(0 1 2 3 5 8)
end
