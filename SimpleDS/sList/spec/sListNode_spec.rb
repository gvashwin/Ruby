require '../sListNode.rb'

describe "SL_Node Unit Tests" do
    it "Defaults to all  nil node" do 
        @node = SL_Node.new
        @node.value.should == nil
        @node.next.should == nil
    end
    it "Initial argument should get assinged" do
        @node = SL_Node.new(5)
        @node.value.should == 5
        @node.next.should == nil
    end
    it "Next of new node should always be nil" do 
        @node1 = SL_Node.new()
        @node2 = SL_Node.new(10)
        @node1.next.should == nil
        @node2.next.should == nil
    end
    it "to_s method on orphan or new node\
    should have NIL at the end" do 
        @node1 = SL_Node.new(5)
        "#{@node1}".should == "5->NIL"
    end

    it "to_s method on connected node should not have NIL" do 
        @node1 = SL_Node.new(5)
        @node2 = SL_Node.new(6)
        @node1.next = @node2
        "#{@node1}".should == "5->"
    end
end
