def event(name)
  puts "ALERT: #{name}" if yield
end

Dir['*events.rb'].each {|file| load file}

