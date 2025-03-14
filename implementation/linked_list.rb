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