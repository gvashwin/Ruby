require './BinaryTreeNode.rb'

class BinarySearchTree
    @root
    def initialize(root = nil)
        @root = root
    end

    def print_in_order()
        if(@root == nil)
            puts "Tree is empty!"
        end
        puts "Inorder Traversal of the tree is :"
        in_order(@root)
        puts ""
    end

    def insert(item)
        to_insert = BinaryTreeNode.new(item)
        if(@root == nil)
            @root = to_insert
            to_insert = nil
            return
        else
            parent = get_parent(@root,item)
            if(parent == nil)
                raise "Unexpected Condition met : Parent null"
            else
                if (item <= parent.value)
                    parent.left = to_insert
                else
                    parent.right = to_insert
                end
            end
        end
    end
    private
    
        def get_parent(currNode, val)
            if(val == nil || currNode == nil)
                return nil
            else
                if (val < currNode.value  and currNode.left != nil)
                    getParent(currNode.left, val)
                elsif (val > currNode.value  and currNode.right != nil)
                    getParent(currNode.right, val)
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


end
