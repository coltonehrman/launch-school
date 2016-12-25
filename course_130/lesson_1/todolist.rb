class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError, 'Can only add Todo objects' unless todo.is_a?(Todo)
    @todos << todo
  end

  def size
    @todos.count
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def item_at(index)
    @todos.fetch(index)
  end

  def remove_at(index)
    todo = @todos.fetch(index)
    @todos.delete(todo)
  end

  def mark_done_at(index)
    todo = @todos.fetch(index)
    todo.done!
  end

  def mark_undone_at(index)
    todo = @todos.fetch(index)
    todo.undone!
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def each
    @todos.each do |todo|
      yield(todo)
    end
    self
  end

  def select
    new_list = TodoList.new(title)
    each do |todo|
      new_list.add(todo) if yield(todo)
    end
    new_list
  end

  def find_by_title(title)
    each do |todo|
      return todo if todo.title == title
    end
    nil
  end

  def all_done
    select do |todo|
      todo.done?
    end
  end

  def all_not_done
    select do |todo|
      !todo.done?
    end
  end

  def mark_done(title)
    todo = find_by_title(title)
    todo.done! if todo
  end

  def mark_all_done
    each do |todo|
      todo.done!
    end
  end

  def mark_all_undone
    each do |todo|
      todo.undone!
    end
  end

  def to_s
    string = "---- #{title} ----\n"
    @todos.each do |todo|
      string += todo.to_s
      string += "\n"
    end
    string
  end
end

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description = '')
    @title = title
    @description = description
    @done = false
  end

  def done!
    @done = true
  end

  def done?
    done
  end

  def undone!
    @done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

list.mark_done('go to gym')


puts list
