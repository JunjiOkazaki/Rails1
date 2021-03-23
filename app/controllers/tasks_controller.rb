class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = "スケジュール「#{@task.title}」を登録しました"
      redirect_to tasks_path 
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new
    end
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = "スケジュール「#{@task.title}」を更新しました"
      redirect_to tasks_path
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "スケジュール「#{@task.title}」を削除しました"
    redirect_to tasks_path 
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:title, :start, :end, :allday, :memo, :created_at, :update_at)
  end
end
