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
            return
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
    def removeFirst()
        if(@head == nil and @tail ==  nil)
            raise "List Empty - Remove Failed!"
            return
        end
        ret = @head.value
        if(@head == @tail)
            @head = nil
            @tail = nil
        else
            new_head = @head.next
            @head.next = nil
            @head = new_head
            new_head = nil
        end
        @length = @length - 1
        return ret
    end

    def remove(item)
        if(@head == nil and @tail ==  nil)
            raise "List Empty - Remove Failed!"
            return
        end
        found = false
        curr_node =@head
        prev_node = nil
        while(curr_node != nil)
            if(curr_node.value == item)
                found = true
                break
            else
                prev_node = curr_node
                curr_node = curr_node.next
            end
        end
        if(!found)
            raise "Item not found - Remove Failed!"
            return
        else
            @length = @length - 1
            if(curr_node == @head)
                new_head = @head.next
                @head.next = nil
                if(@tail == @head)
                    @head = new_head
                    @tail = new_head
                else
                    @head = new_head
                end
            elsif(curr_node == @tail)
                prev_node.next = nil
                @tail = prev_node
                curr_node = nil
            else
                prev_node.next = curr_node.next
                curr_node.next = nil
                cur_node = nil
            end
            return true
        end
    end

    def to_s
        if(@head == nil or @tail == nil)
            "List is empty!"
        else
            curr_node = @head
            ret_s = ""
            while(curr_node != nil)
                ret_s = ret_s+"#{curr_node}"
                curr_node = curr_node.next
            end
            return ret_s
        end
    end

    def has_loop?
        if(@head == nil or @tail == nil)
            return false
        end
        slow = @head
        fast = @head
        loop_found = false
        while(fast.next != nil and fast.next.next != nil)
            slow = slow.next
            fast = fast.next.next
            if(slow == fast)
                loop_found = true
                break
            end
        end
        return loop_found
    end
    def [](index)
        if(@head == nil or @tail == nil)
            return nil
        end
        if(index > length-1)
            return nil
        end
        loc = 0
        curr_node = @head
        while(loc != index and curr_node != nil)
            curr_node = curr_node.next
            loc = loc + 1
        end
        return curr_node.value
    end

        
end
