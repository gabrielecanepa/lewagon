require_relative "../models/task"
require_relative "../models/task_list"
require_relative "../views/tasks_view"

class TasksController
  def initialize
    @list = TaskList.new
    @view = TasksView.new
  end

  def index
    display_tasks
  end

  def create
    description = @view.ask_for("description")
    task = Task.new(description)
    @list.create(task)
  end

  def mark_as_done
    display_tasks

    index = @view.ask_for("position").to_i - 1
    task = @list.find(index)
    task.mark_as_done!
  end

  def destroy
    display_tasks

    index = @view.ask_for("position").to_i - 1
    @list.destroy(index)
  end

  private

  def display_tasks
    tasks = @list.all
    @view.display(tasks)
  end
end
