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
    it "Adding to front of empty list" do 
        @list = List.new
        @list.add2front(5)
        @list.head.value.should == 5
        @list.tail.value.should == 5
        @list.length.should == 1
    end
    it "Adding to front of non empty list" do 
        @list = List.new
        @list.append(1)
        @list.append(2)
        @list.append(3)
        @list.append(4)
        @list.append(5)
        @list.append(10)
        @list.add2front(8)
        @list.head.value.should == 8 
        @list.tail.value.should == 10 
        @list.length.should == 7 
    end
    it "Remove last from epmty list" do 
        @list = List.new
        expect {@list.removeLast()}.to raise_exception("List Empty - Remove Failed!")
    end
    it "Remove twice from epmty single element list" do
        @list = List.new
        @list.append(10)
        @list.removeLast().should == 10
        expect {@list.removeLast()}.to raise_exception("List Empty - Remove Failed!")
    end
    it "Verify head and tail are nil after removing last element" do

         @list = List.new
         @list.append(10)
         @list.append(11)
         @list.append(12)
         @list.removeLast().should == 12
         @list.removeLast().should == 11
         @list.removeLast().should == 10
         @list.head.should == nil
         @list.tail.should == nil
         @list.length.should == 0
         expect {@list.removeLast()}.to raise_exception("List Empty - Remove Failed!")
     end

    it "Verify length is correct accross all remove and add methods" do
        @list = List.new
        @list.length.should == 0
       
        @list.append(10)
        @list.length.should == 1
       
        @list.add2front(5)
        @list.length.should == 2
       
        @list.append(12)
        @list.length.should == 3

        @list.removeFirst()
        @list.length.should == 2
        
        @list.removeLast()
        @list.length.should == 1
        
        @list.removeLast()
        @list.length.should == 0
    end

    it "Verify removeFirst on empty list raises execption" do 
        @list = List.new
        expect {@list.removeFirst()}.to raise_exception("List Empty - Remove Failed!")
    end

    it "Verify double removeFirst on single element list" do 
        @list = List.new
        @list.append(10)
        @list.removeFirst().should == 10
        expect {@list.removeLast()}.to raise_exception("List Empty - Remove Failed!")
    end

    it "Verify removeFirst on changes head(tail) refs" do 
        @list = List.new
        @list.append(10)
        @list.append(20)
        @list.removeFirst().should == 10
        @list.head.value.should == 20
        @list.tail.value.should == 20
        @list.head.should == @list.tail
        @list.removeFirst().should == 20
        @list.head.should == nil
        @list.tail.should == nil
        expect {@list.removeLast()}.to raise_exception("List Empty - Remove Failed!")
    end 
end
