#################
# METHOD 1 - using built-in method
#################

# using built-in method
def is_palindrome_shortcut?(str1)
	str2 = str1.reverse
	return true if str2 == str1
	return false
end

puts is_palindrome_shortcut?('たけやぶやけた') #==> true
puts is_palindrome_shortcut?('たけやぶやけ') #==> false

#Unit Test
describe 'is_palindrome_shortcut?' do
  it 'should return true' do
    result = is_palindrome?('たけやぶやけた')
    expect(result).to eq true
  end

  it 'should return false' do
    result = is_palindrome?('たけやぶやけ')
    expect(result).to eq false
  end
end

# Time to execute n characters of str1 (is_palindrome_shortcut?)
#
# ==> time_to_execute = time_execute_reverse_line_per_n * n + 2 * time_execute_per_line_of_code
#
#


#################
# METHOD 2 - coding from scratch
#################

def is_palindrome?(str1)
	str2 = ""
	str1_max_index = str1.length - 1
	range = str1_max_index..0
	(range.first).downto(range.last).each do |i|
		str2 += str1[i]
	end

  return true if str2 == str1
  return false
end
puts is_palindrome?('たけやぶやけた') #==> true
puts is_palindrome?('たけやぶやけ') #==> false

#Unit Test
describe 'is_palindrome?' do
  it 'should return true' do
    result = is_palindrome?('たけやぶやけた')
    expect(result).to eq true
  end

  it 'should return false' do
    result = is_palindrome?('たけやぶやけ')
    expect(result).to eq false
  end
end

# Time to execute n characters of str1 (is_palindrome?)
#
# ==> time_to_execute = time_execute_per_line_of_code * (1 * n + 5)
#
#
