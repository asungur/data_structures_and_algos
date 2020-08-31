class Queue
	def initialize
		@data = []
	end
	def enqueue(element)
		@data << element
	end
	def dequeue
		@data.shift
	end
	def read
		@data.first
	end
end

class PrintManager
  def initialize
    @queue = Queue.new
  end

  def queue_print_job(doc)
    @queue.enqueue(doc)
  end

  def run
    while @queue.read
      print(@queue.dequeue)
    end
  end

  private

  def print(doc)
    puts doc
  end
end

print_manager = PrintManager.new
print_manager.queue_print_job("First Document")
print_manager.queue_print_job("Second Document")
print_manager.queue_print_job("Third Document")
print_manager.run