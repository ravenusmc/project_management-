class TasksController < ApplicationController
  before_action :set_project 

  def create
    @task = @work.tasks.create(task_params)
    redirect_to @work
  end

  def destroy
    @task = @work.tasks.find(params[:id])
    if @task.destroy
      flash[:success] = "Task was deleted."
    else 
      flash[:error] = "Task was not deleted."
    end 
    redirect_to @work
  end

  private 

  def set_project
    @work = Work.find(params[:work_id])
  end

  def task_params
    params[:task].permit(:content)
  end 

end
