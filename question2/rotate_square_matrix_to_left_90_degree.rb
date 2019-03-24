#################
#1 - Test: Rotate a n x n matrix to the left 90 degree with n < 1024
#################
describe 'Step 1: Check if this is a legit square maxtrix with n < 1024' do
  it 'should return true' do
    matrix = [
            [1, 2, 3, 4], 
            [5, 6, 7, 8], 
            [9, 10, 11, 12], 
            [13, 14, 15, 16] 
          ]
    expect(legit_matrix?(matrix)).to eq true
  end

  it 'Empty array should return false' do
    matrix = []
    expect(legit_matrix?(matrix)).to eq false
  end

  it 'Not square matrix should return false' do
    matrix =  [
            [1, 2, 3], 
            [5, 6, 7], 
            [9, 10, 11], 
            [13, 14, 15] 
          ]
    expect(legit_matrix?(matrix)).to eq false
  end

  it 'n >= 1024 should return false' do
    matrix_1024 = []
    (1..1024).each do |i|
      row = []
      (1..1024).each do |j|
        row << j
      end
      matrix_1024 << row
    end
    expect(legit_matrix?(matrix_1024)).to eq false
  end
end

describe 'Step 2: Find transpose of matrix' do
  it 'should return true' do
    matrix = [
            [1, 2, 3, 4], 
            [5, 6, 7, 8], 
            [9, 10, 11, 12], 
            [13, 14, 15, 16] 
          ]

    transpose(matrix)

    transposed_matrix = [
            [1, 5, 9, 13], 
            [2, 6, 10, 14], 
            [3, 7, 11, 15], 
            [4, 8, 12, 16] 
          ]
    expect(matrix).to eq transposed_matrix
  end
end


describe 'Step 3: swap elements of column one by one for matrix' do
  it 'should return true' do
    matrix = [
            [1, 5, 9, 13], 
            [2, 6, 10, 14], 
            [3, 7, 11, 15], 
            [4, 8, 12, 16] 
          ]

    reverse_columns(matrix)

    reversed_column_matrix = [
            [4, 8, 12, 16], 
            [3, 7, 11, 15], 
            [2, 6, 10, 14], 
            [1, 5,  9, 13] 
          ]
    expect(matrix).to eq reversed_column_matrix
  end
end

describe 'Final step: check if rotate90_left method is accurate' do
  it 'should return true' do
    matrix = [
            [1, 2, 3, 4], 
            [5, 6, 7, 8], 
            [9, 10, 11, 12], 
            [13, 14, 15, 16] 
          ]

    rotate90_left(matrix)

    rotate90_left_matrix = [
            [4, 8, 12, 16], 
            [3, 7, 11, 15], 
            [2, 6, 10, 14], 
            [1, 5,  9, 13] 
          ]
    expect(matrix).to eq rotate90_left_matrix
  end
end


#################
# 2 - Write code
#################

# step 1: 
def legit_matrix?(arr)
  return false if arr.length == 0
  n = arr.length
  
  if n < 1024
    arr.each_index do |i|
      return false if n != arr[i].length
    end
    return true
  else
    return false
  end
end

# step 2: Method for do transpose of matrix
def transpose(arr)
  arr.each_index do |i|
    (i..(arr.length-1)).each do |j|
      t = arr[i][j] 
      arr[i][j] = arr[j][i] 
      arr[j][i] = t 
    end
  end
end

# step 3: After transpose we swap elements of column 
# one by one for finding left rotation of matrix 
# by 90 degree 
def reverse_columns(arr)
  arr.each_index do |i|
    j = 0
    k = arr.length-1
    while j < k do
      t = arr[j][i] 
      arr[j][i] = arr[k][i] 
      arr[k][i] = t 
      j += 1
      k -= 1
    end
  end
end
    
# Final step: Method to anticlockwise rotate matrix 
# by 90 degree 
def rotate90_left(arr)
  if legit_matrix?(arr)
    transpose(arr) 
    reverse_columns(arr)
  else
    return 'Error: N is not less than 1024 or this is not a N x N matrix.'
  end
end


   
# Running code 
arr = [
  [1, 2, 3, 4], 
  [5, 6, 7, 8], 
  [9, 10, 11, 12], 
  [13, 14, 15, 16] 
]

rotate90_left_matrix = [
  [4, 8, 12, 16], 
  [3, 7, 11, 15], 
  [2, 6, 10, 14], 
  [1, 5,  9, 13] 
]

rotate90_left(arr)

puts arr == rotate90_left_matrix # ==> true


