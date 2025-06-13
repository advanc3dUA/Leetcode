import UIKit

//You are given two 0-indexed integer arrays nums1 and nums2 of equal length n and a positive integer k. You must choose a subsequence of indices from nums1 of length k.
//
//For chosen indices i0, i1, ..., ik - 1, your score is defined as:
//
//The sum of the selected elements from nums1 multiplied with the minimum of the selected elements from nums2.
//It can defined simply as: (nums1[i0] + nums1[i1] +...+ nums1[ik - 1]) * min(nums2[i0] , nums2[i1], ... ,nums2[ik - 1]).
//Return the maximum possible score.
//
//A subsequence of indices of an array is a set that can be derived from the set {0, 1, ..., n-1} by deleting some or no elements.
//
// 
//
//Example 1:
//
//Input: nums1 = [1,3,3,2], nums2 = [2,1,3,4], k = 3
//Output: 12
//Explanation:
//The four possible subsequence scores are:
//- We choose the indices 0, 1, and 2 with score = (1+3+3) * min(2,1,3) = 7.
//- We choose the indices 0, 1, and 3 with score = (1+3+2) * min(2,1,4) = 6.
//- We choose the indices 0, 2, and 3 with score = (1+3+2) * min(2,3,4) = 12.
//- We choose the indices 1, 2, and 3 with score = (3+3+2) * min(1,3,4) = 8.
//Therefore, we return the max score, which is 12.
//Example 2:
//
//Input: nums1 = [4,2,3,1,1], nums2 = [7,5,10,9,6], k = 1
//Output: 30
//Explanation:
//Choosing index 2 is optimal: nums1[2] * nums2[2] = 3 * 10 = 30 is the maximum possible score.

//class Solution {
//    func maxScore(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {
//        var result = 0
//        let combined = [(Int, Int)](zip(nums2, nums1)).sorted(by: { $0.0 > $1.0 })
//        var maxKs = [Int]()
//        for pair in combined {
//            if maxKs.count < k {
//                maxKs.append(pair.1)
//            } else {
//                guard let minValue = maxKs.min() else { continue }
//                if pair.1 >= minValue {
//                    let indexToRemove = maxKs.firstIndex(of: minValue)!
//                    maxKs.remove(at: indexToRemove)
//                    maxKs.append(pair.1)
//                }
//            }
//            if maxKs.count == k {
//                let sum = maxKs.reduce(0, +)
//                let currentMax = sum * pair.0
//                result = max(result, currentMax)
//            }
//        }
//        return result
//    }
//}

class Solution {
    func maxScore(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {
        let n = nums1.count
        var result = 0
        let pairs = zip(nums2, nums1).sorted { $0.0 > $1.0 }
        
        var selected = [Int]()
        var sum = 0
        
        for (minMultiplier, value) in pairs {
            var left = 0, right = selected.count
            while left < right {
                let mid = (left + right) / 2
                if selected[mid] < value {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            selected.insert(value, at: left)
            sum += value

            if selected.count > k {
                sum -= selected.removeFirst()
            }
            
            if selected.count == k {
                result = max(result, sum * minMultiplier)
            }
        }
        
        return result
    }
}

let solution = Solution()
print(solution.maxScore([1,3,3,2], [2,1,3,4], 3))
print(solution.maxScore([4,2,3,1,1], [7,5,10,9,6], 1)) 
