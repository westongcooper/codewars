def permutations(string)
  permute(string.split("")).map(&:join).uniq
end

def permute(ary)
  return [ary] if ary.size <= 1
  ary.flat_map.with_index do |e, i|
    rest = ary.dup.tap {|a| a.delete_at(i) }
    permute(rest).collect {|a| a.unshift(e) }
  end
end