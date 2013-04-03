def pairs(ar,diff)
    count = 0
    hash = Hash[ar.zip]
    ar.each do |x|
        if(hash[x] == nil)
            ahead = x + diff
            behind = x - diff
            if(hash.has_key?(ahead) and (hash[ahead] == nil) )
                count +=1
                hash[ahead] = true
                hash[x] = true
            end
            if(hash.has_key?(behind) and (hash[behind] == nil) )
                count +=1
                hash[behind] = true
                hash[x] = true

            end
        end
        
    end
    print "",count
end


line1 = STDIN.readline.split(" ")
N = line1[0].to_i
K = line1[1].to_i

ar = STDIN.readline.strip.split.map {|i| i.to_i}

pairs(ar, K)

