class Class
    def attr_accessor_with_history(attr_name)
        attr_name = attr_name.to_s # make sure it's a string
        attr_reader attr_name
        attr_reader attr_name+"_history"
        class_eval %Q"
            def #{attr_name}=(value)
                if !defined? @#{attr_name}_history
                    @#{attr_name}_history = [@#{attr_name}]
                end
                @#{attr_name} = value
                @#{attr_name}_history << value
            end
        "
    end
end

class Foo
    attr_accessor_with_history :bar
end

class Foo2
    attr_accessor_with_history :bar
    def initialize()
        @bar = 'init'
    end
end

f = Foo.new
f.bar = 1
f.bar = nil
f.bar = '2'
f.bar = [1,nil,'2',:three]
f.bar = :three
puts "First bar:", f.bar.inspect, f.bar_history.inspect
puts "Correct?", f.bar_history == [f.class.new.bar, 1, nil, '2', [1,nil,'2',:three], :three] ? "yes" : "no"
old_bar_history = f.bar_history.inspect

f2 = Foo2.new
f2.bar = 'baz'
f2.bar = f2
puts "\nSecond bar:", f2.bar.inspect, f2.bar_history.inspect
puts "Correct?", f2.bar_history == [f2.class.new.bar, 'baz', f2] ? "yes" : "no"

puts "\nIs the old f.bar intact?", f.bar_history.inspect == old_bar_history ? "yes" : "no"