class Task < ActiveRecord::Base
  POINTS = %w(0 1 2 3 5 8)
  validates_presence_of :user_id, :title, :status
  validates_inclusion_of :status, in: %w(unstarted doing done)
  belongs_to :user
  scope :active, -> { where(status: ['unstarted', 'doing']).order("status ASC, updated_at DESC") }
  scope :owned_by, -> (user) { where(user_id: user ) }

  before_validation :set_default_status

  def set_default_status
    self.status = 'unstarted' unless self.status
  end
end
