class CircularQueue
  def initialize(size)
    @queue = [nil] * size
    @oldest_spot = 0
    @next_spot = 0
  end

  def dequeue
    return nil if empty?
    removed = @queue[@oldest_spot]
    @queue[@oldest_spot] = nil
    new_oldest_spot
    removed
  end

  def enqueue(object)
    next_spot_was_taken = !@queue[@next_spot].nil?
    @queue[@next_spot] = object
    new_next_spot
    new_oldest_spot if next_spot_was_taken
  end

  private

  def empty?
    @queue.all?(&:nil?)
  end

  def new_oldest_spot
    @oldest_spot += 1
    @oldest_spot = 0 if @oldest_spot >= @queue.size
  end

  def new_next_spot
    @next_spot += 1
    @next_spot = 0 if @next_spot >= @queue.size
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
p queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
