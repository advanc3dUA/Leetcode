import UIKit

//Koko loves to eat bananas. There are n piles of bananas, the ith pile has piles[i] bananas. The guards have gone and will come back in h hours.
//
//Koko can decide her bananas-per-hour eating speed of k. Each hour, she chooses some pile of bananas and eats k bananas from that pile. If the pile has less than k bananas, she eats all of them instead and will not eat any more bananas during this hour.
//
//Koko likes to eat slowly but still wants to finish eating all the bananas before the guards return.
//
//Return the minimum integer k such that she can eat all the bananas within h hours.
//
// 
//
//Example 1:
//
//Input: piles = [3,6,7,11], h = 8
//Output: 4
//Example 2:
//
//Input: piles = [30,11,23,4,20], h = 5
//Output: 30
//Example 3:
//
//Input: piles = [30,11,23,4,20], h = 6
//Output: 23

class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        let sortedPiles = piles.sorted()
        
        var low = 1
        var high = sortedPiles.last!
        
        while low < high {
            let speed = (low + high) / 2

            var time = 0
            for pile in sortedPiles {
                time += (pile + speed - 1) / speed
                if time > h { break }
            }
            
            if time <= h {
                high = speed
            } else if time > h {
                low = speed + 1
            }
        }
        return low
    }
}

let solution = Solution()
print(solution.minEatingSpeed([3, 6, 7, 11], 8))
//print(solution.minEatingSpeed([30,11,23,4,20], 5))
print(solution.minEatingSpeed([312884470], 312884469))
