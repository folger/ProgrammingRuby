inc = Proc.new {|x| x+1}
p inc.call(2)

dec = lambda {|x| x-1}
p dec.call(10)

mul = proc {|x| x*10}
p mul.call(3)

