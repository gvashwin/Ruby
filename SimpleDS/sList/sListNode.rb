class SL_Node
    attr_accessor :value, :next
    def initialize(value = nil)
        @value = value
        @next = nil
    end
    def to_s
        if(@next == nil)
            "#{value}->NIL"
        else
            "#{value}->"
        end
    end
end

