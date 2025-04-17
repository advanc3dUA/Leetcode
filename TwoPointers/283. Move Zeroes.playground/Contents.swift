import UIKit

//Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.
//
//Note that you must do this in-place without making a copy of the array.
//
// 
//
//Example 1:
//
//Input: nums = [0,1,0,3,12]
//Output: [1,3,12,0,0]
//Example 2:
//
//Input: nums = [0]
//Output: [0]
// 
//
//Constraints:
//
//1 <= nums.length <= 104
//-231 <= nums[i] <= 231 - 1
// 
//
//Follow up: Could you minimize the total number of operations done?

//class Solution {
//    func moveZeroes(_ nums: inout [Int]) {
//        var nullIndex = 0
//        var numberIndex = 1
//        
//        while nullIndex < nums.count && numberIndex < nums.count {
//            if nums[nullIndex] != 0 {
//                nullIndex += 1
//                numberIndex = nullIndex + 1
//            } else {
//                
//                if nums[numberIndex] == 0 {
//                    numberIndex += 1
//                } else {
//                    nums.swapAt(nullIndex, numberIndex)
//                    nullIndex += 1
//                    numberIndex = nullIndex + 1
//                }
//            }
//        }
//    }
//}

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var lastNonZero = 0
        
        for current in 0..<nums.count {
            if nums[current] != 0 {
                nums.swapAt(lastNonZero, current)
                lastNonZero += 1
            }
        }
    }
}

let solution = Solution()
var array = [4,2,4,0,0,3,0,5,1,0]
solution.moveZeroes(&array)
print(array)
