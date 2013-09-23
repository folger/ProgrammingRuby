#!/usr/bin/env ruby

begin
  File.open('a.txt') do |file|
  end
rescue Exception => e
  puts e
end