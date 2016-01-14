class Person
  def initialize first, last
    @first = first
    @last = last
  end
  def greet
    "Hello, #{@first} #{@last}!"
  end
end