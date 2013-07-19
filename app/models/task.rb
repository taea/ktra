class Task < ActiveRecord::Base
  attr_accessible :finished_at, :memo, :point, :started_at, :status, :title, :iteration_id
end
