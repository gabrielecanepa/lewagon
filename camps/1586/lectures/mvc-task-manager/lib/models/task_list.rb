require_relative "task"

class TaskList
  def initialize
    @tasks = []
  end

  def all
    @tasks
  end

  def create(task)
    @tasks << task
  end

  def find(index)
    @tasks[index]
  end

  def destroy(index)
    @tasks.delete_at(index)
  end
end
