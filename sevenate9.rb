def seven_ate9(str)
  str.gsub!('797', '77') while str.include?('797'); str
end
