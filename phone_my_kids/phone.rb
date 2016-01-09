class Mother
  # Add a method (or more) to track all kids
  def self.kids
    @descendants ||= []
  end

  def self.inherited(descendant)
    kids << descendant
  end
  def self.phone_kids
    self.kids.each do |kid| kid.phone end
  end
end


class Foo < Mother; end
class Bar < Mother; end

Mother.phone_kids