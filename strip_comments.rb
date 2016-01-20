def domain_name(url)
  /(https?:\/\/w{0,3}\.?|www\.?)([^.]*)/.match(url)[2]
end