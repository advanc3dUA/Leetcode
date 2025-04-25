import UIKit

//Given a binary array nums, you should delete one element from it.
//
//Return the size of the longest non-empty subarray containing only 1's in the resulting array. Return 0 if there is no such subarray.
//
//
//
//Example 1:
//
//Input: nums = [1,1,0,1]
//Output: 3
//Explanation: After deleting the number in position 2, [1,1,1] contains 3 numbers with value of 1's.
//Example 2:
//
//Input: nums = [0,1,1,1,0,1,1,0,1]
//Output: 5
//Explanation: After deleting the number in position 4, [0,1,1,1,1,1,0,1] longest subarray with value of 1's is [1,1,1,1,1].
//Example 3:
//
//Input: nums = [1,1,1]
//Output: 2
//Explanation: You must delete one element.
//
//
//Constraints:
//
//1 <= nums.length <= 105
//nums[i] is either 0 or 1.

class Solution {
    func longestSubarray(_ nums: [Int]) -> Int {
        var longestSubArrayLength = 0
        var left = 0
        var right = 0
        var nullsCount = 0
        var firstNullIndex = 0
        
        for right in 0..<nums.count {
            if nums[right] == 0 {
                nullsCount += 1
                
                if nullsCount > 1 {
                    left = firstNullIndex + 1
                    nullsCount -= 1
                }
                
                firstNullIndex = right
            }
            if nullsCount <= 1 {
                longestSubArrayLength = max(longestSubArrayLength, right - left + 1 - nullsCount)
                
            }
        }
        return nullsCount > 0 ? longestSubArrayLength : longestSubArrayLength - 1
    }
}

class Solution2 {
    func longestSubarray(_ nums: [Int]) -> Int {
        var lastZero = -1
        var prevZero = -1
        var maxLen = 0
        
        for i in 0..<nums.count {
            if nums[i] == 0 {
                prevZero = lastZero
                lastZero = i
            }
            maxLen = max(maxLen, i - prevZero - 1)
        }
        return maxLen
    }
}

let solution = Solution()
print(solution.longestSubarray([1,1,0,1])) // 3
print(solution.longestSubarray([0,1,1,1,0,1,1,0,1])) // 5
print(solution.longestSubarray([1,1,1])) // 2
print(solution.longestSubarray([1,1,0,0,1,1,1,0,1])) // 4
