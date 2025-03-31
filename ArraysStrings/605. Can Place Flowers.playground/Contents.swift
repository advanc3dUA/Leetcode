import UIKit

//You have a long flowerbed in which some of the plots are planted, and some are not. However, flowers cannot be planted in adjacent plots.
//
//Given an integer array flowerbed containing 0's and 1's, where 0 means empty and 1 means not empty, and an integer n, return true if n new flowers can be planted in the flowerbed without violating the no-adjacent-flowers rule and false otherwise.
//
//
//
//Example 1:
//
//Input: flowerbed = [1,0,0,0,1], n = 1
//Output: true
//Example 2:
//
//Input: flowerbed = [1,0,0,0,1], n = 2
//Output: false
//
//
//Constraints:
//
//1 <= flowerbed.length <= 2 * 104
//flowerbed[i] is 0 or 1.
//There are no two adjacent flowers in flowerbed.
//0 <= n <= flowerbed.length

class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        if n == 0 {
            return true
        }
        
        guard flowerbed.count > 1 else {
            if n > 1 {
                return false
            }
            if n == 1 {
                return flowerbed.first == 0 ? true : false
            }
            return false
        }
        
        var number = n
        var prevFlower = 0
        
        for index in 0..<flowerbed.count {
            if number > 0 {
                let left = index == 0 ? 0 : prevFlower
                let right = index == flowerbed.count - 1 ? 0 : flowerbed[index + 1]
                
                
                if left == 0, flowerbed[index] == 0, right == 0 {
                    prevFlower = 1
                    number -= 1
                    
                    if number == 0 {
                        return true
                    }
                } else {
                    prevFlower = flowerbed[index]
                }
            }
        }
        return false
    }
}

let solution = Solution()
print(solution.canPlaceFlowers([0, 0, 1, 0, 1], 1))
