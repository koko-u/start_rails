class TasksController < ApplicationController
  def index
    @tasks = Task.unfinished.paginate(:page => params[:page], :per_page => 10)
  end
  def done
    @tasks = Task.finished.paginate(:page => params[:page], :per_page => 10)
    render :action => 'index'
  end

  def finish
    @task = Task.find(params[:id])
    @task.update_attribute(:done, true)
    redirect_to tasks_path
  end
  def restart
    @task = Task.find(params[:id])
    @task.update_attribute(:done, false)
    redirect_to done_tasks_path
  end

  def search
    @tasks = Task.unfinished
    @tasks = @tasks.search(params[:query]) if params[:query].present?
    @tasks = @tasks.paginate(:page => params[:page], :per_page => 10)
    render :action => 'index'
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(params[:task])
    redirect_to @task
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes(params[:task])
    redirect_to @task
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

end
