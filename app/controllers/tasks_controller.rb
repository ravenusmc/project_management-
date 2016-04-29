class TasksController < ApplicationController
  before_action :set_project 
  before_action :set_task, except: [:create]

  def create
    @task = @work.tasks.create(task_params)
    redirect_to @work
  end

  def destroy
    if @task.destroy
      flash[:success] = "Task was deleted."
    else 
      flash[:error] = "Task was not deleted."
    end 
    redirect_to @work
  end

  def complete
    @task.update_attribute(:completed_at, Time.now)
    redirect_to @work, notice: "Task Completed"
  end 

  private 

  def set_project
    @work = Work.find(params[:work_id])
  end

  def task_params
    params[:task].permit(:content)
  end 

  def set_task
    @task = @work.tasks.find(params[:id])
  end 

end
