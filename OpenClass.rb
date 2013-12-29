class String
  def to_alpahnumeric
    gsub(/[^\w\s]/, '')
  end
end

require 'test/unit'
class StringExtensionsTest < Test::Unit::TestCase
  def test_strip_on_non_alphanumeric_characters
    assert_equal('3 the Magic Number', '#3 the *Magic, Number*?'.to_alpahnumeric)
  end
end

class Money
  def initialize(n)
    @n = n
  end
end

class Numeric
  def to_money
    Money.new(self * 100)
  end
end

m = 3.to_money
p m

class Array
  def substitute(from, to)
    self.each_with_index do |e,i|
      self[i] = to if e == from
    end
  end
end

class ArrayReplaceTest < Test::Unit::TestCase
  def test_replace
    book_topics = ['html', 'java', 'css']
    book_topics.substitute('java', 'ruby')
    expected = ['html', 'ruby', 'css']
    assert_equal(book_topics, expected)
  end
end


