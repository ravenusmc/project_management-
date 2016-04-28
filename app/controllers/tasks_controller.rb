class TasksController < ApplicationController
  before_action :set_project 

  def create
    @task = @work.task.create(task_params)

    redirect_to @work
  end

  private 

  def set_project
    @work = Work.find([params[:work_id])
  end

  def task_params
    params[:task].permit(:content)
  end 
  
end
