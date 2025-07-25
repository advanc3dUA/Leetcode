import UIKit

//You are given two positive integer arrays spells and potions, of length n and m respectively, where spells[i] represents the strength of the ith spell and potions[j] represents the strength of the jth potion.
//
//You are also given an integer success. A spell and potion pair is considered successful if the product of their strengths is at least success.
//
//Return an integer array pairs of length n where pairs[i] is the number of potions that will form a successful pair with the ith spell.
//
// 
//
//Example 1:
//
//Input: spells = [5,1,3], potions = [1,2,3,4,5], success = 7
//Output: [4,0,3]
//Explanation:
//- 0th spell: 5 * [1,2,3,4,5] = [5,10,15,20,25]. 4 pairs are successful.
//- 1st spell: 1 * [1,2,3,4,5] = [1,2,3,4,5]. 0 pairs are successful.
//- 2nd spell: 3 * [1,2,3,4,5] = [3,6,9,12,15]. 3 pairs are successful.
//Thus, [4,0,3] is returned.
//Example 2:
//
//Input: spells = [3,1,2], potions = [8,5,8], success = 16
//Output: [2,0,2]
//Explanation:
//- 0th spell: 3 * [8,5,8] = [24,15,24]. 2 pairs are successful.
//- 1st spell: 1 * [8,5,8] = [8,5,8]. 0 pairs are successful.
//- 2nd spell: 2 * [8,5,8] = [16,10,16]. 2 pairs are successful.
//Thus, [2,0,2] is returned.

//class Solution {
//    func successfulPairs(_ spells: [Int], _ potions: [Int], _ success: Int) -> [Int] {
//        var result = Array(repeating: 0, count: spells.count)
//        
//        for i in 0..<spells.count {
//            potions.forEach { potion in
//                result[i] += (spells[i] * potion) >= success ? 1 : 0
//            }
//        }
//        return result
//    }
//}

class Solution {
    func successfulPairs(_ spells: [Int], _ potions: [Int], _ success: Int) -> [Int] {
        var result = Array(repeating: 0, count: spells.count)
        let sortedPotions = potions.sorted()
        let max = sortedPotions.count
        for i in 0..<spells.count {
            let need = (success + spells[i] - 1) / spells[i]
            
            var low = 0
            var high = max
            
            while low < high {
                let mid = (low + high) / 2
                if sortedPotions[mid] >= need {
                    high = mid
                } else {
                    low = mid + 1
                }
            }
            result[i] = max - low
        }
        return result
    }
}

let solution = Solution()
print(solution.successfulPairs([5,1,3], [1,2,3,4,5], 7))

