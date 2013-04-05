require './BinaryTreeNode.rb'
require './BinaryTreeUtil.rb'

class BinarySearchTree
    @root
    include BtUtil
    def initialize(root = nil)
        @root = root
    end

    def print_in_order()
        if(@root == nil)
            puts "Tree is empty!"
            return
        end
        puts "Inorder Traversal of the tree is :"
        in_order(@root)
        puts ""
    end

    def print_pre_order()
        if(@root == nil)
            puts "Tree is empty!"
            return
        end
        puts "Pre-Order Traversal of the tree is :"
        pre_order(@root)
        puts ""
    end
    def print_post_order()
        if(@root == nil)
            puts "Tree is empty!"
            return
        end
        puts "Post-Order Traversal of the tree is :"
        post_order(@root)
        puts ""
    end

    def print_tree()
        if(@root == nil)
            puts "Tree is empty!"
            return
        end
        puts "The Tree is :"
        level_order(@root)
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
    def size()
        if(@root == nil)
            return 0
        end
        node_count(@root)
    end

    def isBst?()
        if(@root == nil)
            return true
        end
        is_bst(@root)
    end
    def height()
        if(@root == nil)
            return 0
        end
        depth(@root)
    end
    private
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
