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

    it "Verify remove() method removes the element" do 
        @list = List.new
        @list.append(10)
        @list.append(20)
        @list.remove(10).should == true
        @list.head.value.should == 20
        @list.head.should == @list.tail
        @list.tail.value.should == 20
    end

    it "Verify remove() method on non-existen item raises expection" do 
        @list = List.new
        @list.append(10)
        @list.append(20)
        @list.remove(10).should == true
        @list.head.value.should == 20
        @list.length.should == 1
        @list.head.should == @list.tail
        @list.tail.value.should == 20
        expect {@list.remove(10)}.to raise_exception("Item not found - Remove Failed!")
        @list.remove(20).should == true
        @list.length.should == 0
        @list.head.should == nil
        @list.tail.should == nil
    end

    it "Verify printing empty list" do
        @list = List.new
       "#{@list}".should == "List is empty!"
    end


    it "Verify printing a list" do 
        @list = List.new
        @list.append(2)
        @list.append(3)
        @list.add2front(1)
        @list.append(4)
        @list.append(5)
        @list.add2front(0)
        "#{@list}".should == "0->1->2->3->4->5->NIL"
        @list.remove(0)
        "#{@list}".should == "1->2->3->4->5->NIL"
        @list.removeFirst()
        "#{@list}".should == "2->3->4->5->NIL"
        @list.removeLast()
        "#{@list}".should == "2->3->4->NIL"
        @list.remove(3)
        "#{@list}".should == "2->4->NIL"
        
    end

    it "Empty List has no loops" do 
        @list = List.new
        @list.has_loop?.should == false
    end
    
    it "Single element looped list has loop" do 
        @list = List.new
        @list.append(2)
        @list.head.next = @list.head
        @list.has_loop?.should == true 
    end

    it "Two element element looped list has loop" do 
        @list = List.new
        @list.append(2)
        @list.append(3)
        @list.tail.next = @list.head
        @list.has_loop?.should == true 
    end

    it "A List with loop" do 
        @list = List.new
        (1..10).each do |x|
            @list.append(x)
        end
        @list.tail.next = @list.head.next.next.next
        @list.has_loop?.should == true 
    end

    it "[] Access to the list" do 
        @list = List.new
        @list[0].should == nil
        @list.append(0)
        @list[0].should == 0
        (1..10).each do |x|
            @list.append(x)
        end
        @list[0].should == 0
        (1..10).each do |x|
            @list[x].should == x
        end
        @list.length.should == 11
    end
end
