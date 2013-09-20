#!/usr/bin/env ruby

def count_frequency(word_list)
  counts = Hash.new(0)
  for word in word_list
    counts[word] += 1
  end
  counts
end

require 'test/unit'

class TestCountFrequency < Test::Unit::TestCase
  def test_empty_list
    assert_equal({}, count_frequency([]))
  end
  
  def test_single_word
    assert_equal({"cat" => 1}, count_frequency(["cat"]))
  end
  
  def test_two_different_words
    assert_equal({"cat" => 1, "sat" => 1}, count_frequency(["cat", "sat"]))
  end
  
  def test_two_words_with_adjacent_repeat
    assert_equal({"cat" => 2, "sat" => 1}, count_frequency(["cat", "cat", "sat"]))
  end
  
  def test_two_words_with_non_adjacent_repeat
    assert_equal({"cat" => 2, "sat" => 1}, count_frequency(["cat", "sat", "cat"]))
  end
end

if __FILE__ == $0
  require_relative "words_from_string.rb"
  raw_text = %{The problem breaks down into two parts. First, given some text
  as a string, return a list of words. That sounds like an array. Then, build
  a count for each distinct word. That sounds like a use for a hash---we can
  index it with the word and use the corresponding entry to keep a count.}
  word_list = words_from_string(raw_text)
  counts = count_frequency(word_list)
  sorted = counts.sort_by {|word, count| count}.reverse!
  top_5 = sorted.first(5)
  
  top_5.each {|word, count| puts "#{word}: #{count}"}
end