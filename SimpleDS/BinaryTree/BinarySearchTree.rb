require './BinaryTreeNode.rb'
require './BinaryTreeUtil.rb'

class BinarySearchTree
    attr_reader :root
    include BtUtil
    def initialize(otherTree = nil)
        if(otherTree == nil)
            @root = nil
        else
            @root = copy_tree(otherTree.root)
        end
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
    def lookup?(item)
        if(@root == nil)
            return false
        end
        find(@root, item)
    end
    def hasPathSum?(sum)
        if(@root == nil)
            return false
        end
        has_path_sum(@root,sum)
    end
    def mirror!()
        if(@root == nil)
            return 
        end
        @root = make_mirror(@root)
    end
    def eql?(other_tree)
        same_tree?(@root, other_tree.root)
    end

    def delete(item)
        if(@root == nil or lookup?(item) == false)
            return false
        end
        currNode = @root
        parent = nil
        while(currNode!= nil and currNode.value != item)
            if(item <= currNode.value)
                parent = currNode
                currNode = currNode.left
            else
                parent = currNode
                currNode = currNode.right
            end
        end
        to_remove = currNode
        if(to_remove.left == nil and to_remove.right == nil)
            #Case : Leaf Node
            if(parent.left == to_remove)
                parent.left = nil
            elsif(parent.right == to_remove)
                parent.right == nil
            else
                raise "Parent and the node to remove are not connected"
            end
        elsif(to_remove.left != nil and to_remove.right == nil)
            #Case : 1 Left Child
             if(parent.left == to_remove)
                parent.left = to_remove.left
            elsif(parent.right == to_remove)
                parent.right == to_remove.left
            else
                raise "Parent and the node to remove are not connected"
            end
        elsif(to_remove.right != nil and to_remove.right == nil)
            #Case : 1 right Child
            if(parent.left == to_remove)
                parent.left = to_remove.right
            elsif(parent.right == to_remove)
                parent.right == to_remove.right
            else
                raise "Parent and the node to remove are not connected"
            end
        else
            #Case : node has 2 children
            #Find the in order successor.
            #The inorder sucesssor is the left most child
            #of the right subtree of the node to be removed.
            in_order_succ_parent = nil
            in_order_succ = to_remove.right
            while(in_order_succ.left != nil)
                in_order_succ_parent = in_order_succ
                in_order_succ = in_order_succ.left
            end
            #Swapping the value to the node to be removed
            #with the inorder successor's value
            to_remove.value = in_order_succ.value
            
            #Removing the in order successor.
            if(in_order_succ_parent == nil)
                #Case : when the inorder successor
                #is the direct right child of the node 
                #to be removed
                to_remove.right = nil
                in_order_succ = nil
            else
                #Case : When the inorder successor
                #is the left most node in the right
                #sub-tree of the node to be removed.
                in_order_succ_parent.left = nil
                in_order_succ = nil
            end
        end
    end
end
