class MinStack
	def initialize()
		@stack = Array.new
		@minStack = Array.new
		@minTop = nil
	end
	def isEmpty
		@stack.size == nil
	end
	def push(item)
		@stack.unshift(item)
		if(@minTop == nil)
			@minTop = item
		elsif(@minTop > item)
			@minTop = item
		end
		@minStack.unshift(@minTop)
	end
	def pop()
		rv = nil
		if(@stack.size == 0)
			raise "Stack is empty"
		else
			@minStack.shift
			rv = @stack.shift
			if(@minStack.size == 0)
				@minTop = nil
			else
				@minTop = @minStack[0]
			end
		end
		return rv
	end
	def min()
		if(@minStack.size == 0)
			raise "Stack is empty"
		else
			@minTop
		end
	end
end

myStack  = MinStack.new

myStack.push(5)
puts "the min so far is : #{myStack.min}"
myStack.push(6)
puts "the min so far is : #{myStack.min}"
myStack.push(3)
puts "the min so far is : #{myStack.min}"
myStack.push(7)
puts "the min so far is : #{myStack.min}"
puts ">>>>>>>>>>>>>POP<<<<<<<<<<<<<<<<<<"
myStack.pop
puts "the min so far is : #{myStack.min}"
myStack.pop
puts "the min so far is : #{myStack.min}"
myStack.pop
puts "the min so far is : #{myStack.min}"
myStack.pop
puts "the min so far is : #{myStack.min}"
