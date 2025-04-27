import UIKit

//Given an array of integers nums, calculate the pivot index of this array.
//
//The pivot index is the index where the sum of all the numbers strictly to the left of the index is equal to the sum of all the numbers strictly to the index's right.
//
//If the index is on the left edge of the array, then the left sum is 0 because there are no elements to the left. This also applies to the right edge of the array.
//
//Return the leftmost pivot index. If no such index exists, return -1.
//
// 
//
//Example 1:
//
//Input: nums = [1,7,3,6,5,6]
//Output: 3
//Explanation:
//The pivot index is 3.
//Left sum = nums[0] + nums[1] + nums[2] = 1 + 7 + 3 = 11
//Right sum = nums[4] + nums[5] = 5 + 6 = 11
//Example 2:
//
//Input: nums = [1,2,3]
//Output: -1
//Explanation:
//There is no index that satisfies the conditions in the problem statement.
//Example 3:
//
//Input: nums = [2,1,-1]
//Output: 0
//Explanation:
//The pivot index is 0.
//Left sum = 0 (no elements to the left of index 0)
//Right sum = nums[1] + nums[2] = 1 + -1 = 0
// 
//
//Constraints:
//
//1 <= nums.length <= 104
//-1000 <= nums[i] <= 1000

//class Solution {
//    func pivotIndex(_ nums: [Int]) -> Int {
//        var leftSumArray = [Int]()
//        var rightSumArray = [Int]()
//        
//        var leftSum = 0
//        var rightSum = 0
//        
//        for i in 0..<nums.count {
//            leftSumArray.append(leftSum)
//            rightSumArray.insert(rightSum, at: 0)
//            
//            leftSum += nums[i]
//            rightSum += nums[nums.count - i - 1]
//        }
//        
//        for i in 0..<leftSumArray.count {
//            if leftSumArray[i] == rightSumArray[i] {
//                return i
//            }
//        }
//        return -1
//    }
//}

class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        let totalSum = nums.reduce(0, +)
        var leftSum = 0
        
        for (index, value) in nums.enumerated() {
            if leftSum == totalSum - leftSum - value {
                return index
            }
            leftSum += value
        }
        return -1
    }
}

let solution = Solution()
print(solution.pivotIndex([1,7,3,6,5,6]))
print(solution.pivotIndex([1,2,3]))
print(solution.pivotIndex([2,1,-1]))
print(solution.pivotIndex([-1,-1,-1,-1,-1,0]))
