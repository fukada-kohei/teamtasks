class TasksController < ApplicationController
  def show
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success]= 'タスクは正常に追加されました'
      redirect_to @task
    else
      flash.now[:danger]= 'タスクを追加できませんでした'
      render 'teams/show'
    end
      
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success]= 'タスクは正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger]= 'タスクを更新できませんでした'
      render :edit
    end
    
    
  end
  
  private
  
  def task_params
    params.require(:task).permit(:title, :content, :progress, :due_date, :team_id)
  end  
  
end
