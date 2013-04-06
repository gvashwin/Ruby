require '../sList.rb'

describe "List Unit Test" do
    it "New List should have both head and tail as nil and length 0" do 
        @list = List.new
        @list.head.should == nil
        @list.tail.should == nil
        @list.length.should == 0
    end
    it "Append on empty list" do 
        @list = List.new
        @list.append(5)
        @list.head.value.should == 5
        @list.tail.value.should == 5
        @list.length.should == 1
    end
    it "Append to non-empty list" do 
        @list = List.new
        @list.append(1)
        @list.append(2)
        @list.append(3)
        @list.append(4)
        @list.append(5)
        @list.append(8)
        @list.head.value.should == 1
        @list.tail.value.should == 8 
        @list.length.should == 6 
    end
end
