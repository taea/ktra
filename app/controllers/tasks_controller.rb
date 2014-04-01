class TasksController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_task, only: [:edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = current_user.tasks.active if user_signed_in?
    @task = Task.new
    @this_week = Week.for_week
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @this_week = Week.for_week
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_param)
    @task.user_id = current_user.id

    respond_to do |format|
      if @task.save
        format.html { redirect_to root_path, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update_attributes(task_param)
        format.html { redirect_to root_path, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  private
  def set_task
    @task = current_user.tasks.find(params[:id])
  end

  def task_param
    params.require(:task).permit(:finished_at, :memo, :point, :started_at, :status, :title, :week_id)
  end
end
