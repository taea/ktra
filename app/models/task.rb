class Task < ActiveRecord::Base
  POINTS = %w(0 1 2 3 5 8)
  validates_presence_of :user_id, :title
  belongs_to :user
  scope :active, -> { where(status: ['unstarted', 'doing']).order("status ASC, updated_at DESC") }
  scope :owned_by, -> (user) { where(user_id: user ) }
end
