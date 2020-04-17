class Todo < ActiveRecord::Base
  belongs_to :user

  def self.overdue
    all.where("due_date < ? and (not completed)", Date.today)
  end

  def self.due_today
    all.where("due_date = ?", Date.today)
  end

  def self.due_later
    all.where("due_date > ?", Date.today)
  end

  def self.of_user(user)
    all.where(user_id: user.id)
  end

  def due_today?
    due_date == Date.today
  end

  def self.completed
    all.where(completed: true)
  end

  def self.show_list
    puts "\nMy Todolist"
    puts "\nOverdue"
    puts overdue.map { |todo| todo.to_displayable_string }
    puts "\nDue Today"
    puts due_today.map { |todo| todo.to_displayable_string }
    puts "\nDue Later"
    puts due_later.map { |todo| todo.to_displayable_string }
  end

  def self.add_task(todo)
    create!(
      todo_text: todo[:todo_text],
      due_date: Date.today + todo[:due_in_days],
      completed: false,
    )
  end

  def self.mark_as_complete!(todo_id)
    todo = Todo.find(todo_id)
    todo.completed = true
    todo.save
    todo
  end
end
