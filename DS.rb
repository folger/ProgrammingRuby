class DS
  def get_mouse_info(id)
    "MOUSE"
  end
  def get_mouse_price(id)
    10
  end
  def get_keyboard_info(id)
    "MOUSE"
  end
  def get_keyboard_price(id)
    20
  end
  def get_cpu_info(id)
    "CPU"
  end
  def get_cpu_price(id)
    30
  end
  def get_display_info(id)
    "DISPLAY"
  end
  def get_display_price(id)
    40
  end
end

class Computer
  def initialize(id, ds)
    @id = id
    @ds = ds
    @ds.methods.grep(/^get_(.+)_info$/) { Computer.define_component($1) }
  end
  
  def self.define_component(name)
    define_method(name) do
      info = @ds.send("get_#{name}_info", @id)
      price = @ds.send("get_#{name}_price", @id)
      result = "#{name.capitalize}: #{info} ($#{price})"
      return result 
    end
  end  
end

com = Computer.new(1, DS.new)


p com.mouse
p com.keyboard
p com.cpu
p com.display

class Computer2
  instance_methods.each do |m|
    undef_method m unless m.to_s =~ /^__|object_id|method_missing|respond_to?/
  end

  def initialize(id, ds)
    @id = id
    @ds = ds
  end

  def method_missing(name, *args)
    super if !respond_to?(name)
    info = @ds.send("get_#{name}_info", @id)
    price = @ds.send("get_#{name}_price", @id)
    result = "#{name.capitalize}: #{info} ($#{price})"
    return result
  end

  def respond_to?(method)
    @ds.respond_to?( "get_#{method}_info" ) || super
  end
end

com2 = Computer2.new(1, DS.new)


p com2.mouse
p com2.keyboard
p com2.cpu
p com2.display
