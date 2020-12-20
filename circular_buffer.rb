class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  def initialize(buffer_size)
    initialize_buffer
    @buffer_size = buffer_size
    @element_add_order = 0
  end

  def clear
    initialize_buffer
  end

  def read 
    raise BufferEmptyException if empty?
    oldest_key = @elements.keys.min
    @elements.delete oldest_key
  end

  def write(new_element)
    raise BufferFullException if full?
    if new_element
      @elements[@element_add_order] = new_element
      @element_add_order += 1
    end
  end

  def write!(new_element)
    return unless new_element
    read if full?
    write new_element
  end

  def empty?
    @elements.empty?
  end

  def full?
    @elements.size == @buffer_size
  end

  private

  def initialize_buffer
    @elements = {}
  end

end