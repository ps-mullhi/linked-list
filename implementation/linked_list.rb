require_relative './node.rb'

class LinkedList

  def initialize()
    @list = nil
  end

  def append(value)
    if @list.nil?
      add_to_empty_list(value)
    else
      current_node = @list
      until current_node.next_node.nil?
        current_node = current_node.next_node
      end
      current_node.next_node = Node.new(value)
    end
  end

  def prepend(value)
    if @list.nil?
      add_to_empty_list(value)
    else
      new_node = Node.new(value, @list)
      @list = new_node
    end
  end

  def size
    if @list.nil?
      return 0
    end

    count = 1

    current_node = @list
    until current_node.next_node.nil?
      count += 1
      current_node = current_node.next_node
    end

    count
  end

  def head
    @list
  end

  def tail
    if @list.nil?
      return nil
    end

    current_node = @list
    until current_node.next_node.nil?
      current_node = current_node.next_node
    end
    current_node
  end

  def at(index)
    if @list.nil?
      return nil
    end

    i = 0
    current_node = @list
    until current_node.next_node.nil? || i == index
      current_node = current_node.next_node
      i += 1
    end

    if i < index
      nil
    else
      current_node
    end
  end

  def pop
    unless @list.nil?
      if @list.next_node.nil?
        @list = nil
      else
        prev_node = @list
        current_node = @list
        until current_node.next_node.nil?
          prev_node = current_node
          current_node = current_node.next_node
        end
        prev_node.next_node = nil
      end
    end
  end

  def contains?(value)
    if @list.nil?
      return false
    else
      found = false
      current_node = @list
      found = true if current_node.value == value
      until current_node.next_node.nil?
        current_node = current_node.next_node
        found = true if current_node.value == value
      end
      found
    end
  end

  def find(value)
    if @list.nil?
      return -1
    else
      index = 0
      current_node = @list
      return index if current_node.value == value
      until current_node.next_node.nil?
        current_node = current_node.next_node
        index += 1
        return index if current_node.value == value
      end

      -1
    end
  end

  def insert_at(value, index)
    if @list.nil?
      add_to_empty_list(value)
      return 
    end


    if index == 0
      prepend(value)
      return
    elsif self.size <= index
      append(value)
      return
    end

    i = 0
    prev_node = @list
    current_node = @list
    until current_node.next_node.nil? || i == index
      prev_node = current_node
      current_node = current_node.next_node
      i += 1
    end

    new_node = Node.new(value, current_node)
    prev_node.next_node = new_node
  end

  def remove_at(index)
    unless @list.nil?
      if index == 0
        @list = @list.next_node
      elsif self.size <= index + 1    
        self.pop
      else
        i = 0
        prev_node = @list
        current_node = @list
        until current_node.next_node.nil? || i == index
          prev_node = current_node
          current_node = current_node.next_node
          i += 1
        end

        prev_node.next_node = current_node.next_node
      end
    end
  end

  def to_s
    if @list.nil?
      return 'nil'
    end

    result = ''

    current_node = @list
    result += "(#{current_node.value}) -> "
    until current_node.next_node.nil?
      current_node = current_node.next_node
      result += "(#{current_node.value}) -> "
    end
    result += 'nil'

    result
  end

  private 

  def add_to_empty_list(value)
    raise "List is supposed to be empty" unless @list.nil?
    
    @list = Node.new(value)
  end
end