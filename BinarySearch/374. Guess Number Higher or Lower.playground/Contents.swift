import UIKit

//We are playing the Guess Game. The game is as follows:
//
//I pick a number from 1 to n. You have to guess which number I picked.
//
//Every time you guess wrong, I will tell you whether the number I picked is higher or lower than your guess.
//
//You call a pre-defined API int guess(int num), which returns three possible results:
//
//-1: Your guess is higher than the number I picked (i.e. num > pick).
//1: Your guess is lower than the number I picked (i.e. num < pick).
//0: your guess is equal to the number I picked (i.e. num == pick).
//Return the number that I picked.
//
// 
//
//Example 1:
//
//Input: n = 10, pick = 6
//Output: 6
//Example 2:
//
//Input: n = 1, pick = 1
//Output: 1
//Example 3:
//
//Input: n = 2, pick = 1
//Output: 1

/**
 * Forward declaration of guess API.
 * @param  num -> your guess number
 * @return          -1 if num is higher than the picked number
 *                  1 if num is lower than the picked number
 *               otherwise return 0
 * func guess(_ num: Int) -> Int
 */

class Solution {
    func guessNumber(_ n: Int) -> Int {
        var low = 1
        var high = n
        
        while low <= high {
            let mid = (low + high) / 2
            let pick = guess(mid)
            switch pick {
            case 0: return mid
            case -1: high = mid - 1
            case 1: low = mid + 1
            default: break
            }
        }
        return low
    }
}
