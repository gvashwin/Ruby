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
end
