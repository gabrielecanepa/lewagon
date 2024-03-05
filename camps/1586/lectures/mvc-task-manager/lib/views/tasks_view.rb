class TasksView
  def display(tasks)
    tasks.each_with_index do |task, index|
      done = task.done? ? "[x]" : "[ ]"
      puts "#{done} #{index + 1} - #{task.description}"
    end
  end

  def ask_for(input)
    puts "What's the #{input}"
    gets.chomp
  end
end
