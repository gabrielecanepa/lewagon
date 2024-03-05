require_relative "controllers/tasks_controller"

class Router
  def initialize
    @controller = TasksController.new
  end

  def run
    loop do
      print_actions
      action = gets.chomp.to_i
      dispatch(action)
    end
  end

  private

  def print_actions
    puts "---"
    puts "What do you want to do?"
    puts "1 - List all tasks"
    puts "2 - Create a task"
    puts "3 - Mark a task as done"
    puts "4 - Delete a task"
    puts "---"
  end

  def dispatch(action)
    case action
    when 1 then @controller.index
    when 2 then @controller.create
    when 3 then @controller.mark_as_done
    when 4 then @controller.destroy
    else puts "Wrong option"
    end
  end
end
