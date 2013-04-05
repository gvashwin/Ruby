module BtUtil
     def node_count(currNode)
            if(currNode == nil)
                return 0 
            end
           return 1 \
               + node_count(currNode.left) \
               + node_count(currNode.right)
    end
    def depth(currNode)
            if(currNode == nil)
                return 0
            end
            1 + max(depth(currNode.left), depth(currNode.right))
    end
    def max(i,j)
        if (i > j)
            return i
         else
            return j
        end
    end
    def is_bst(currNode)
        if(currNode == nil)
             return true
         end
         (currNode.left == nil or currNode.left.value < currNode.value) \
                and (currNode.right == nil or currNode.right.value > currNode.value) \
                and is_bst(currNode.left) \
                and is_bst(currNode.right)
        end 
	def count_nodes(currNode)
		if(currNode == nil)
			return 0 
		end
	   return 1 \
		   + count_nodes(currNode.left) \
		   + count_nodes(currNode.right)
	end 

	def level_order(currNode)
		if(currNode == nil)
			return
		end
		nodeQ = []
		nodeQ.push(currNode)
		while(!nodeQ.empty?)
			tmpNode = nodeQ.shift()
			puts "#{tmpNode}"
			if(tmpNode.left != nil)
				nodeQ.push(tmpNode.left)
			end
			if(tmpNode.right != nil)
				nodeQ.push(tmpNode.right)
			end
		end
	end

	def get_parent(currNode, val)
		if(val == nil || currNode == nil)
			return nil
		else
			if (val < currNode.value  and currNode.left != nil)
				get_parent(currNode.left, val)
			elsif (val > currNode.value  and currNode.right != nil)
				get_parent(currNode.right, val)
			else
				return currNode
			end
		end
	end

	def in_order(currNode)
		if(currNode == nil)
			return
		end
		in_order(currNode.left)
		print "#{currNode.value} "
		in_order(currNode.right)
	end

	def pre_order(currNode)
		if(currNode == nil)
			return
		end
		print "#{currNode.value} "
		pre_order(currNode.left)
		pre_order(currNode.right)
	end
	def post_order(currNode)
		if(currNode == nil)
			return
		end
		post_order(currNode.left)
		post_order(currNode.right)
		print "#{currNode.value} "
	end
 
end

