#!/usr/bin/env ruby

require 'csv'
require_relative 'BookInStock'

class CsvReader
  def initialize
    @books_in_stock = []
  end
  
  def read_in_csv_data(csv_file_name)
    CSV.foreach(csv_file_name, headers: true) do |row|
      @books_in_stock << BookInStock.new(row["ISBN"], row["Price"])
    end
  end
  
  def total_value_in_stock
    sum = 0.0
    @books_in_stock.each {|book| sum += book.price}
    sum
  end
  
  def number_of_each_isbn
    # ...
  end
end

if __FILE__ == $0
  reader = CsvReader.new
  ARGV.each do |csv_file_name|
    STDERR.puts "Processing #{csv_file_name}"
    reader.read_in_csv_data(csv_file_name)
  end
  puts "Total value = #{reader.total_value_in_stock}"
end