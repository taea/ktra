class AddIterationIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :iteration_id, :integer
  end
end
