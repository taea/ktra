class WeeksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_week, only: [:show]

  def index
    @weeks = Week.since_first_task_by(current_user).order('start_date DESC')
  end

  def show
    @tasks = @week.tasks.owned_by(current_user)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @week }
    end
  end

  private
  def set_week
    @week = Week.find(params[:id])
  end
end
