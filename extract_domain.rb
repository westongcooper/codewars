def solution(input, markers)
  input.gsub(Regexp.new("\\s(["+ markers.join + "][^$]*?)*$"), "")
end