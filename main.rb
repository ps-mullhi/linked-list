require_relative "implementation/linked_list.rb"

def main
  list = LinkedList.new

  list.append(25)
  list.append(30)
  list.append(35)
  list.append(40)

  p list
  puts list

  list2 = LinkedList.new
  
  list2.prepend(20)
  list2.prepend(15)
  list2.prepend(10)

  p list2
  puts list2

  puts list.size
  puts list2.size
end

main