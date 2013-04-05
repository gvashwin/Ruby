module BtUtil
     def node_count(currNode)
            if(currNode == nil)
                return 0 
            end
           return 1 \
               + node_count(currNode.left) \
               + node_count(currNode.right)
    end 
end

