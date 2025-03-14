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

  puts list2.head
  puts list2.find(200)

  list2.prepend(20)
  list2.prepend(15)
  list2.prepend(10)

  p list2
  puts list2

  puts list.size
  puts list2.size

  puts list.head.value
  puts list2.head.value
  puts list.tail.value
  puts list2.tail.value

  p list.at(3)

  puts list2.contains?(20)
  puts list2
  puts list2.find(20)
  list2.pop
  puts list2.contains?(20)
  puts list2
  list2.pop
  puts list2
  puts list2.contains?(10)
  list2.pop
  puts list2
  list2.pop
  puts list2
end

main