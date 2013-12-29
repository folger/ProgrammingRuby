class MyClass
  def initialize
  end

  def my_method(my_arg)
    my_arg * 2
  end
end

class MyClass
  define_method :my_method2 do |my_arg|
    my_arg * 3
  end
end

obj = MyClass.new
p obj.my_method(3)
p obj.send(:my_method, 3)
p obj.my_method2(3)