require '../sList.rb'

describe "List Unit Test" do
    it "New List should have both head and tail as nil" do 
        @list = List.new
        @list.head.should == nil
        @list.tail.should == nil
    end
end
