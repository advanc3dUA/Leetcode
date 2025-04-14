import UIKit

//Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].
//
//The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
//
//You must write an algorithm that runs in O(n) time and without using the division operation.
//
// 
//
//Example 1:
//
//Input: nums = [1,2,3,4]
//Output: [24,12,8,6]
//Example 2:
//
//Input: nums = [-1,1,0,-3,3]
//Output: [0,0,9,0,0]
// 
//
//Constraints:
//
//2 <= nums.length <= 105
//-30 <= nums[i] <= 30
//The input is generated such that answer[i] is guaranteed to fit in a 32-bit integer.
// 
//
//Follow up: Can you solve the problem in O(1) extra space complexity? (The output array does not count as extra space for space complexity analysis.)

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var results = [Int]()
        
        var leftProduct = 1
        
        for index in 0..<nums.count {
            results.append(leftProduct)
            leftProduct *= nums[index]
        }

        var rightProduct = 1
        
        for index in stride(from: nums.count - 1, through: 0, by: -1) {
            results[index] *= rightProduct
            rightProduct *= nums[index]
        }
        
        return results
    }
}

let solution = Solution()
print(solution.productExceptSelf([-1,1,0,-3,3]))
