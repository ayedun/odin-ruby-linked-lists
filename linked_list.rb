require "pry-byebug"
require_relative "./node.rb"




class LinkedList
    attr_accessor :head
    def initialize
        @head = nil
    end

    def append(value)
        if @head == nil
            @head = Node.new(value)
        else 
            tail.next_node = Node.new(value)
        end

    end

    def print_list(current_node = @head)
        if current_node.next_node.nil?
            p "value: #{current_node.value}... next value: None}"
            return
        end
        p "value: #{current_node.value}... next value: #{current_node.next_node.value}"
        print_list(current_node.next_node)
    end

    def prepend(value)
        if @head.nil?
        #     @head = Node.new(value)
        else
            p @head
            p head.next_node
            @head = Node.new(value, @head)                           #-1 10-2-4
        end
    end


    def head(current_node = @head)
        return current_node
    end

    def tail(current_node = @head)
        return current_node if current_node.next_node.nil?
        tail(current_node.next_node)
    end

    def size(current_node = @head, size = 0)
        if @head.nil?
            return size
        elsif current_node.next_node.nil?
            return size + 1
        end
        size += 1
        size = size(current_node.next_node, size)
        return size
    end

    def at(index, current_node = @head, count = 0)
        if @head.nil?
            return "Invalid. No list."
        elsif index == count
            p "Value at index #{index}: #{current_node.value} || next_node: #{current_node.next_node.value}"
            return
        else
            count += 1
            at(index, current_node.next_node, count)
        end
    end

    def pop(current_node = @head)
        if @head.nil?
            return
        elsif current_node.next_node.next_node.nil?
            p current_node
            current_node.next_node = nil
            p "Last element was popped"
            p current_node
            return
        else
            pop(current_node.next_node)
        end
    end

end

my_list = LinkedList.new
my_list.append(2)
my_list.append(3)
my_list.append(4)
my_list.append(5)
my_list.append(6)

my_list.prepend(1)
my_list.prepend(0)
p "Size: #{my_list.size}"
# puts  my_list
p "Head: #{my_list.head.value}"
p "Tail: #{my_list.tail.value}"
my_list.at(3)
my_list.print_list
my_list.pop
my_list.print_list



