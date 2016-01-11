def rgb(*args)
  args.map{ |a| "%02X" % [255,[0,a].max].min }.join
end

print rgb(0,0,0)