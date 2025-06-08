import UIKit

//Given an integer array nums and an integer k, return the kth largest element in the array.
//
//Note that it is the kth largest element in the sorted order, not the kth distinct element.
//
//Can you solve it without sorting?
//
// 
//
//Example 1:
//
//Input: nums = [3,2,1,5,6,4], k = 2
//Output: 5
//Example 2:
//
//Input: nums = [3,2,3,1,2,4,5,5,6], k = 4
//Output: 4
// 
//
//Constraints:
//
//1 <= k <= nums.length <= 105
//-104 <= nums[i] <= 104

//class Solution {
//    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
//        var heap: [Int] = []
//        
//        for num in nums {
//            var i = 0
//            while i < heap.count && heap[i] < num {
//                i += 1
//            }
//            heap.insert(num, at: i)
//        }
//        return heap[0]
//    }
//}

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var heap = Array<Int>()
        for num in nums {
            if heap.count < k {
                var i = 0
                while i < heap.count && heap[i] < num {
                    i += 1
                }
                heap.insert(num, at: i)
            } else {
                if num > heap[0] {
                    var i = 0
                    while i < heap.count && heap[i] < num {
                        i += 1
                    }
                    heap.insert(num, at: i)
                    heap.removeFirst()
                }
            }
        }
        return heap[0]
    }
}


let solution = Solution()
print(solution.findKthLargest([3,2,1,5,6,4], 2))
