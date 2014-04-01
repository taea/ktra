class ChangeIterationsToWeeks < ActiveRecord::Migration
  def change
    rename_column :tasks, :iteration_id, :week_id
    rename_table :iterations, :weeks
  end
end
