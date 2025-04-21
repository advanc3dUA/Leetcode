import UIKit

//You are given an integer array nums and an integer k.
//
//In one operation, you can pick two numbers from the array whose sum equals k and remove them from the array.
//
//Return the maximum number of operations you can perform on the array.
//
// 
//
//Example 1:
//
//Input: nums = [1,2,3,4], k = 5
//Output: 2
//Explanation: Starting with nums = [1,2,3,4]:
//- Remove numbers 1 and 4, then nums = [2,3]
//- Remove numbers 2 and 3, then nums = []
//There are no more pairs that sum up to 5, hence a total of 2 operations.
//Example 2:
//
//Input: nums = [3,1,3,4,3], k = 6
//Output: 1
//Explanation: Starting with nums = [3,1,3,4,3]:
//- Remove the first two 3's, then nums = [1,4,3]
//There are no more pairs that sum up to 6, hence a total of 1 operation.
// 
//
//Constraints:
//
//1 <= nums.length <= 105
//1 <= nums[i] <= 109
//1 <= k <= 109

class Solution {
    func maxOperations(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        var dict: [Int: Int] = [:]
            
        nums.forEach { num in
            if let saved = dict[num] {
                dict[num]! += 1
            } else {
                dict[num] = 1
            }
        }
        
        for (key, value) in dict {
            let diff = k - key
            if let savedDiffValue = dict[diff] {
                result += min(value, dict[diff]!)
                
            }
        }
            
        return result / 2
    }
}

let solution = Solution()
print(solution.maxOperations([1,2,3,4], 5)) // 2
print(solution.maxOperations([3,1,3,4,3], 6)) // 1
print(solution.maxOperations([4,4,1,3,1,3,2,2,5,5,1,5,2,1,2,3,5,4], 2)) // 2
print(solution.maxOperations([2,2,2,3,1,1,4,1], 4)) // 2
