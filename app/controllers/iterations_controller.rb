class IterationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_iteration, only: [:show]

  def index
    @iterations = Iteration.order('start_date DESC')
  end

  def show
    @tasks = current_user.tasks.where(iteration_id: @iteration)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @iteration }
    end
  end

  private
  def set_iteration
    @iteration = Iteration.find(params[:id])
  end
end
