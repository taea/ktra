class StatusesController < ApplicationController
  before_action :set_task
  respond_to :js

  def update
    @task.update_attributes(status_param)
    @this_week = Week.current
  end

  private

  def set_task
    @task = current_user.tasks.find(params[:task_id])
  end

  def status_param
    params.require(:task).permit(:status, :week_id)
  end
end
