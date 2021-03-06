require './BinaryTreeNode.rb'

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

    def find(currNode, item)
        if(currNode == nil)
            return false
        end
        if(item < currNode.value)
            find(currNode.left, item)
        elsif(item > currNode.value)
            find(currNode.right, item)
        else
            return true
        end
    end

    def has_path_sum(currNode,sum)
        if(currNode == nil)
            return false
        end
        if(sum-currNode.value == 0 \
           and currNode.left == nil \
           and currNode.right == nil)
            puts "True !!! #{currNode.value}"
            return true
        end
        has_path_sum(currNode.left, (sum - currNode.value)) \
            or has_path_sum(currNode.right, (sum - currNode.value))
    end

    def make_mirror(currNode)

        if(currNode == nil)
            return nil
        end
        temp_left = make_mirror(currNode.left)
        temp_right = make_mirror(currNode.right)
        currNode.left = temp_right
        currNode.right = temp_left
        return currNode
    end

    def copy_tree(currNode)
        if(currNode == nil)
            return nil
        end
        node2return = BinaryTreeNode.new(currNode.value)
        node2return.left =  copy_tree(currNode.left)
        node2return.right =  copy_tree(currNode.right)
        return node2return
    end

    def same_tree?(this_node, that_node)
        if(this_node == nil and that_node == nil)
            return true
        elsif(this_node !=nil and that_node == nil)
            return false
        elsif(this_node == nil and that_node != nil)
            return false
        elsif( this_node.value == that_node.value \
              and same_tree?(this_node.left, that_node.left) \
              and same_tree?(this_node.right, that_node.right) )
                return true
        else
            return false
        end
    end

end

