class LruChache
    @uppper_bound
    @chache
    @map
    def initialize()
            @chache = Array.new
            @map = Hash.new
            @upper_bound = 0
    end
    def bound(bound_val = 0)
        @upper_bound = bound_val
        while(@chache.size > @upper_bound)
           to_remove = @chache.delete_at(@chache.size-1)
           @map.delete(to_remove)
        end
    end
    def set(key = nil, val=nil)
        if(key == nil || val == nil || @upper_bound <= 0)
            return
        end
        if(@map.has_key?(key))
            if(@chache[0] == key)
                 @map[key] = val
            else
                @chache.delete(key)
                @chache.insert(0,key)
                @map[key] = val
            end
        elsif(@chache.length < @upper_bound)
            #Chache is not full so just add
             @chache.insert(0,key)
             @map[key] = val
        else
            #cache is full neeed to remove 
            #the least recently used item
            to_remove = @chache.delete_at(@chache.size-1)
            @map.delete(to_remove)
            @chache.insert(0,key)
            @map[key] = val
        end
    end
    def peek(key)
        if(@map[key] == nil)
            puts "NULL"
        else
            puts "#{@map[key]}"
        end
    end
    def dump()
        if(@upper_bound == 0)
            puts "NULL"
            return
        end
        key_list = @map.keys.sort
        key_list.each do |key|
            puts "#{key} #{@map[key]}"
        end
    end

    def get(key)
        if(!@map.has_key?(key))
            #case when key not found in cache
            puts "NULL"
        else
            #case when key is found
            ret = @map[key]
            if(@chache[0] != key)
               @chache.delete(key)
               @chache.insert(0,key)
            end
            puts "#{ret}"
        end
    end
end

NumOperations= gets.to_i
lru = LruChache.new
for i in (1..NumOperations)
    line = gets.strip.split(" ")
    operation = line[0].to_s
    case operation
    when "BOUND"
        upper_bound = line[1].to_i
        lru.bound(upper_bound)
    when "SET"
        key = line[1].to_s
        val = line[2].to_s
        lru.set(key, val)
    when "GET"
        key = line[1].to_s
        lru.get(key)
    when "PEEK"
        key = line[1].to_s
        lru.peek(key)
    when "DUMP"
        lru.dump()
    else
    end
end


    
