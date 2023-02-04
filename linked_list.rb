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
            current_node.next_node = nil
            p "Last element was popped"
            return
        else
            pop(current_node.next_node)
        end
    end

    def contain?(value, current_node = @head)
        state = false
        if current_node.value == value
            state =true
            return p "Does the list contain #{value}? -> #{state}"
        elsif current_node.next_node.nil?
            return p "Does the list contain #{value}? -> #{state}"
        else
            contain?(value, current_node.next_node)
        end
        # return p "Does the list contain #{value}? -> #{state}"
    end

    def find?(value, current_node = @head, index = 0)
        state = false
        if current_node.value == value
            state =true
            return p "List contains value #{value} at index-> #{index}"
        elsif current_node.next_node.nil?
            return p "List contains value #{value}? Nil"
        else
            find?(value, current_node.next_node, index + 1)
        end
        # return p "Does the list contain #{value}? -> #{state}" 
    end

    def to_s(current_node = @head, current_string = "")
        if (current_node.next_node.nil?)
            return p current_string += "#{current_node.value} -> Nil"
        else 
            current_string += "#{ current_node.value} -> "
            to_s(current_node.next_node, current_string)
        end
        
    end


    def insert_at(value, index, current_node=@head, current_index = 0)
        if index == current_index + 1
            remainder = current_node.next_node
            # current_node.next_node = nil
            current_node.next_node = Node.new(value, remainder)
        elsif current_node.next_node.nil?
            return p"Invalid, list end"
        else
            insert_at(value, index, current_node.next_node, current_index + 1)
        end

            

    end

    def remove_at(index, current_node=@head, current_index = 0)
        if index == current_index + 1
            remainder_value = current_node.next_node.next_node.value
            remainder = current_node.next_node.next_node
            current_node.next_node = remainder
        elsif current_node.next_node.nil?
            return p"Invalid, list end"
        else
            remove_at(index, current_node.next_node, current_index + 1)
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
p "Head: #{my_list.head.value}"
p "Tail: #{my_list.tail.value}"
my_list.at(3)
my_list.to_s
my_list.pop
my_list.to_s
my_list.contain?(3)
my_list.contain?(8)
my_list.find?(3)
my_list.find?(8)
my_list.to_s
my_list.insert_at(90, 2)
my_list.to_s
my_list.remove_at(2)
my_list.to_s






