# Write a method that returns the "pivot" index of a list of integers. We define the pivot index as the index
# where the sum of the numbers on the left is equal to the sum of the numbers on the right. Given [1, 4, 6,
# 3, 2], the method should return 2, since the sum of the numbers to the left of index 2 is equal to the sum
# of numbers to the right of index 2 (1 + 4 = 3 + 2). If no such index exists, it should return -1. If there are
# multiple pivots, you can return the left-most pivot.
# You can write the method in any language. Make sure that the method:
#  • runs successfully
#  • handles all edge cases
#  • is as efficient as you can make it!
# A successful answer will fulfill the above criteria.

arr1 = [1, 4, 6, 3, 2]       # one correct answer (2)
arr2 = [10, 1, 0, 0, 11, 0]  # multiple pivots (left most pivot/index)
arr3 = [1, 2, 3, 4, 5]       # no pivot (-1)
arr4 = [2, 2, 1, 7, 2, 3]    # one correct answer (3)

class SumPivot
  def initialize(arr)
    @arr = arr
    @arr_length = @arr.length

    @arr_l = []
    @arr_r = []

    validations
  end

  def pivot
    @arr.each_with_index do |v,k|
      splited = split @arr, k

      if splited
        sum_l = @arr_l.inject(:+)
        sum_r = @arr_r.inject(:+)

        return k if sum_l == sum_r
      end

      return -1 if k == (@arr_length - 1)
    end
  end

  private

  def split(arr, index)
    # can't sum unless we have at least two values to the left and right of index
    if index > 1 && index < (@arr_length - 2)
      @arr_l = arr[0..(index-1)]
      @arr_r = arr[(index+1)..@arr_length]
      return true
    else
      return false
    end
  end

  def validations
    check_arr
  end

  def check_arr
    raise "We need at least two numbers to sum, 5 numbers to compare sums and have at least one pivot" unless @arr.length > 4
  end
end

# DOIT

sum_pivot = SumPivot.new arr4
puts sum_pivot.pivot
