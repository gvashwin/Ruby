class BinaryTreeNode
    attr_accessor :left, :right, :value
    def initialize(value = nil)
        @value = value
        @left = nil
        @right = nil
    end
    def to_s
        if (left == nil and right == nil)
            "Nil#{left}<-:#{value}:->#{right}Nil"
        elsif (left != nil and right == nil)
            "#{left}<-:#{value}:->#{right}Nil"
        elsif (left == nil and right != nil)
            "#Nil{left}<-:#{value}:->#{right}"
        else
            "#{left}<-:#{value}:->#{right}"
        end
    end 
end
