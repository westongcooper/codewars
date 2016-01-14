def tongues(code)
  upper = {  v: %W(A I Y E O U), c: %W(B K X Z N H D C W G P V J Q T S R L M F) }
  lower = { v: %W(a i y e o u), c: %W(b k x z n h d c w g p v j q t s r l m f) }
  code.split("").map do |c|
    case c
      when /[A-Z]/
        decode(upper,c)
      when /[a-z]/
        decode(lower,c)
      else
        c
    end
  end.join
end

def decode(array,c)
  array[:v].index(c) ? array[:v][(array[:v].index(c) + 3) % 6] : array[:c][(array[:c].index(c) + 10) % 20]
end