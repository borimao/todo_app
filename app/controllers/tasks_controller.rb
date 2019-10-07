class TasksController < ApplicationController
    def index
        @tasks = Task.where(user_id: current_user.id)
        @task = Task.new
        @user = User.find(current_user.id)
    end 

    def create
        @task = Task.create(task_params)
        redirect_to tasks_path
    end
    
    def edit
        @task = Task.find(params[:id])
        if @task.user_id != current_user.id
            redirect_to tasks_path
        end
    end
    
    def update
        @task = Task.find(params[:id])
        if @task.user_id != current_user.id
            redirect_to tasks_path
        end
        @task.update(task_params)
        redirect_to tasks_path
    end
    
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to tasks_path
    end

    
    private
        def task_params
          params.require(:task).permit(:title,:user_id)
        end
end
