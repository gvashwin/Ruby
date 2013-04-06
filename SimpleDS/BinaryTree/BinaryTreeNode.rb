class BinaryTreeNode
    attr_accessor :left, :right, :value
    def initialize(value = nil)
        @value = value
        @left = nil
        @right = nil
    end
    def to_s
        if (left == nil and right == nil)
            "~<-:#{value}:->~\n"
        elsif (left != nil and right == nil)
            "#{left.value}<-:#{value}:->~\n"
        elsif (left == nil and right != nil)
            "~<-:#{value}:->#{right.value}\n"
        else
            "#{left.value}<-:#{value}:->#{right.value} \n"
        end
    end 
end
