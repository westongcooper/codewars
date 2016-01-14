require_relative '../framework'

class Hash
  def method_missing(k)
    if self.has_key? k
      return self[k]
    elsif self.has_key? k.to_s
      return self[k.to_s]
    end
  end
end

Test.assert_equals({a: 1}.a, 1)
Test.assert_equals({'b' => 1}.b, 1)