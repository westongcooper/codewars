require_relative '../framework'
def rot13(string)
  string = string.split("").map do |c|
    x = /[A-Z]/ === c ? 65 : 97
    /[A-Za-z]/ === c ? (((c.ord - x) + 13) % 26 + x).chr : c
  end
  string.join('')
end

# describe "Rot13" do
#   it "test" do
#     Test.expect("grfg" == rot13("test"), "Input: test , Expected Output: grfg , Actual Output: " + rot13("test"))
#   end
#   it "Test" do
#     Test.expect("Grfg" == rot13("Test"), "Input: Test , Expected Output: Grfg , Actual Output: " + rot13("Test"))
#   end
# end

print rot13("Test")
print rot13("test")