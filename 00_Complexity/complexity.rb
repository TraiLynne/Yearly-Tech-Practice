=begin

  #  Homework - Complexity
  #
  #
  #  For the following functions, write the expected Time and Auxiliary Space
  #  Complexity using what you know about nested loops, hash table look-ups and
  #  the runtime of built in functions.
  #
  #  NOTE: You don't need to code to anything for these problems, just write
  #  what you the complexity to be using big-O notation
  #

=end

=begin

  #   Order of Magnitude
  #
  #   Reduce the following into it's Big-O order of magnitude.
  #
  #  1. 5 + N                    // N
  #  2. N + N^2                  // N^2
  #  3. 15N + 13N                // N
  #  4. 10000                    // 10000
  #  5. log(N) + 1               // log(N)
  #  6. log(N) * 3 + 14N + 3     // N
  #  7. Nlog(N) + 3N^2           // N^2
  #  8. N^3 + log(N^4)           // N^3
  #  9. N! + 180000N^2           // N!
  #  10. 15002^N                 // 15002^N

=end

=begin
  #    Index Of
  #
  #    Given an array of integers and a target value, return the index of the first
  #    element that matches the target value. If there are no matches, return -1.
  #
  #    Parameters
  #    Input: arr {Array of Integers}
  #    Input: target {Integer}
  #    Output: {Integer}
  #
  #    Examples
  #    [1, 2, 3, 4, 5, 6], 5 --> 4
  #    [9, 83, 74], 8 --> -1
  #    [6, 4, 7, 9, 7, 8, 2, 4, 3], 7 --> 2

  # Time Complexity: O(N)
  # Auxiliary Space Complexity: O(1)
=end

def index_of(arr, target)
  arr.each_index do |i|
    return i if arr[i] == target
  end
  -1
end

p index_of([1, 2, 3, 4, 5, 6], 5) # 4
p index_of([9, 83, 74], 8) # -1
p index_of([6, 4, 7, 9, 7, 8, 2, 4, 3], 7) # 2

=begin
  #    Evens
  #
  #    Given an array of integers, return an array of only the even values.
  #
  #    Parameters
  #    Input: arr {Array of Integers}
  #    Output: {Array of Integers}
  #
  #    Examples
  #    [1, 2, 3, 4, 5, 6] --> [2, 4, 6]
  #    [9, 83, 74] --> [74]
  #    [6, 4, 7, 9, 7, 8, 2, 4, 3] --> [6, 4, 8, 2, 4]

  # Time Complexity: O(N)
  # Auxiliary Space Complexity: O(N)
=end

def evens(arr)
  results = []
  arr.each do |item|
    results.push(item) if item.even?
  end
  results
end

p evens([1, 2, 3, 4, 5, 6]) # [2, 4, 6]
p evens([9, 83, 74]) # [74]
p evens([6, 4, 7, 9, 7, 8, 2, 4, 3]) # [6, 4, 8, 2, 4]

=begin
  #   Sum
  #
  #   Given an array of integers, return the sum of all the integers.
  #
  #   Parameters
  #   Input: arr {Array of Integers}
  #   Output: {Integer}
  #
  #   Examples
  #   [1, 2, 3, 4, 5] --> 15
  #   [0, 1, -1] --> 0
  #   [] --> 0
  #
  # Time Complexity: O(N)
  # Auxiliary Space Complexity: O(1)
=end

def sum(arr)
  total = 0
  arr.each_index do |i|
    total += arr[i]
  end
  total
end

p sum([1, 2, 3, 4, 5]) # 15
p sum([0, 1, -1]) # 0
p sum([]) # 0

=begin
  #   Merge Arrays

  #   Given two sorted arrays of integers, return a merged sorted array of both inputs.
  #
  #   Parameters
  #   Input: arr1 {Array of Integers}
  #   Input: arr2 {Array of Integers}
  #   Output: {Array of Integers}
  #
  #   Examples
  #   [1, 3, 9], [2, 4, 8] --> [1, 2, 3, 4, 8, 9]
  #   [12, 25, 40], [20, 37, 45] --> [12, 20, 25, 37, 40, 45]
  #   [10, 13, 24], [12, 35] --> [10, 12, 13, 24, 25]
  #
  # Time Complexity: O(M+N)
  # Auxiliary Space Complexity: O(M+N)
=end

def merge_arrays(left, right)
  sorted_array = []
  p1 = 0
  p2 = 0
  while p1 < left.length and p2 < right.length
    if left[p1] <= right[p2]
      sorted_array.push(left[p1])
      p1 += 1
    else
      sorted_array.push(right[p2])
      p2 += 1
    end
  end
  sorted_array.concat right.slice(p2, right.length) if p1 >= left.length
  sorted_array.concat left.slice(p1, left.length) if p2 >= right.length
  sorted_array
end

p merge_arrays([1, 3, 9], [2, 4, 8]) # [1, 2, 3, 4, 8, 9]
p merge_arrays([12, 25, 40], [20, 37, 45]) # [12, 20, 25, 37, 40, 45]
p merge_arrays([10, 13, 24], [12, 35]) # [10, 12, 13, 24, 25]

=begin
  #    Binary Search
  #    Given a sorted array and a target value, use binary search to return the index of the target in the input array.
  #    Return -1 if no such target is found.
  #
  #    Parameters
  #    Input: arr {Array of Integers}
  #    Input: val {Integer}
  #    Output: {Integer}
  #
  #    Examples
  #    [1, 3, 4, 5, 8, 9], 5 --> 3
  #    [5, 7, 10, 12, 14], 7 --> 1
  #    [2, 4, 8, 9, 15], 3 --> -1
  #
  # Time Complexity: O(log(N))
  # Auxiliary Space Complexity: O(1)
=end

def binary_search(arr, val)
  low = 0
  high = arr.length - 1
  while low <= high
    mid = (low + high) / 2
    if arr[mid] > val
      high = mid - 1
    elsif arr[mid] < val
      low = mid + 1
    else
      return mid
    end
  end
  -1
end

p binary_search([1, 3, 4, 5, 8, 9], 5) # 3
p binary_search([5, 7, 10, 12, 14], 7) # 1
p binary_search([2, 4, 8, 9, 15], 3) # -1

=begin
  #    Factorial
  #
  #    Given an input integer n, return the n factorial value.
  #
  #    Parameters
  #    Input: n {Integer}
  #    Output: {Integer}
  #
  #   Examples
  #   5  --> 120 (5 * 4 * 3 * 2 * 1)
  #   1 --> 1 (1)
  #   9 --> 362880 (9 * 8 * 7 * 6 * 5 * 4 * 3 * 2 * 1)

  # Time Complexity: O(N!)
  # Auxiliary Space Complexity: O(N)
=end

def factorial(n)
  return 1 if n == 1

  n * factorial(n - 1)
end

p factorial(5) # 120
p factorial(1) # 1
p factorial(9) # 362880

# Time Complexity: O(1)
# Auxiliary Space Complexity: O(1)

def first_times_last(arr)
  result = nil
  return result if arr.length < 2

  arr[0] * arr[arr.length - 1]
end

# Time Complexity: O(N)
# Auxiliary Space Complexity: O(N)

def most_frequent_occurrence(str)
  lower_str = str.downcase
  letters = {}
  most_frequent = []

  for i in 0..lower_str.length - 1
    if letters[lower_str[i]]
      letters[lower_str[i]] += 1
    else
      letters[lower_str[i]] = 1
    end
  end

  letters.each do |key, value|
    most_frequent = [key, value] if most_frequent.length == 0 || letters[key] > most_frequent[1]
  end

  most_frequent[0]
end

# Time Complexity:
# Auxiliary Space Complexity:

def print_unordered_pairs(arr)
  for i in 0..arr.length - 1
    for j in (i + 1)..arr.length - 1
      puts arr[i].to_s + ',' + arr[j].to_s
    end
  end
  nil
end

# Make Combined Matrix
#
# Time Complexity:
# Auxiliary Space Complexity:

def make_combined_matrix(array_one, array_two)
  result = []

  for i in 0..array_one.length - 1
    row = []
    for j in 0..array_two.length - 1
      row.push(array_two[j] + array_one[i])
    end
    result.push(row)
  end

  result
end

# Nth Fibonacci
#
# Time Complexity:
# Auxiliary Space Complexity:
def nth_fibonacci(n)
  result = [0, 1]

  for i in 1..n - 1
    result[i + 1] = result[i] + result[i - 1]
  end

  result[n]
end

# Nth Fibonacci - the return
#
# Time Complexity:
# Auxiliary Space Complexity:
def nth_fibonacci(n)
  cache = {}

  search_fib = lambda do |index|
    return cache[index] unless cache[index].nil?
    return index if index < 2

    result = search_fib.call(index - 1) + search_fib.call(index - 2)
    cache[index] = result
    cache[index]
  end

  search_fib.call(n)
end
