require_relative  "sListNode.rb"

class List
    attr_accessor :head, :tail
    attr_reader :length
    def initialize()
        @head = nil
        @tail = nil
        @length = 0
    end
    def append(item)
        node2append = SL_Node.new(item)
        if(@head == nil)
            #Case when list is empty
           if(@tail != nil)
               raise "Head is nil but tail is not"
           end
           @head = node2append
           @tail = node2append
        else
            #Case when list is not empty
            if(@tail == nil)
                raise "Head is not null but tail is null"
            end
            @tail.next = node2append
            @tail = node2append
        end
        #incr length
        @length = @length + 1
        node2append = nil
    end 
    def add2front(item)
        node2add = SL_Node.new(item)
        if(@head == nil)
            #Case when list is empty
           if(@tail != nil)
               raise "Head is nil but tail is not"
           end
           @head = node2add
           @tail = node2add
        else
            node2add.next = @head
            @head = node2add
        end
        @length = @length + 1
        node2add = nil
    end
    def removeLast()
        if(@head == nil and @tail ==  nil)
            raise "List Empty - Remove Failed!"
        end
        #finding the new tail
        #the node which last but 1
        curr_node = @head
        new_tail = nil
        while(curr_node != @tail)
            new_tail = curr_node
            curr_node = curr_node.next
        end
        ret = @tail.value
        if(new_tail == nil)
            #Case for single element list
            @head = nil
            @tail = nil
            curr_node = nil
        else
            #Case else
            new_tail.next = nil
            @tail = new_tail
            new_tail = nil
            curr_node = nil
        end
        @length = @length - 1
        return ret
    end
end
