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
    def lookup?(item)
        if(@root == nil)
            return false
        end
        find(@root, item)
    end

end
