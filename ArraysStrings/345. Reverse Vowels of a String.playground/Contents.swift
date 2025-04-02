import UIKit

//Given a string s, reverse only all the vowels in the string and return it.
//
//The vowels are 'a', 'e', 'i', 'o', and 'u', and they can appear in both lower and upper cases, more than once.
//
// 
//
//Example 1:
//
//Input: s = "IceCreAm"
//
//Output: "AceCreIm"
//
//Explanation:
//
//The vowels in s are ['I', 'e', 'e', 'A']. On reversing the vowels, s becomes "AceCreIm".
//
//Example 2:
//
//Input: s = "leetcode"
// [e, e, o, e] -> [e, o, e, e]
//Output: "leotcede"
//
// 
//
//Constraints:
//
//1 <= s.length <= 3 * 105
//s consist of printable ASCII characters.

class Solution {
    func reverseVowels(_ s: String) -> String {
        var chars = Array(s)
        let vowels: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        var left = 0
        var right = chars.count - 1
        
        while left < right {
            while left < right && !vowels.contains(chars[left]) {
                left += 1
            }
            while left < right && !vowels.contains(chars[right]) {
                right -= 1
            }
            if left < right {
                chars.swapAt(left, right)
                left += 1
                right -= 1
            }
        }
        return String(chars)
    }
}

let solution = Solution()
print(solution.reverseVowels("IceCreAm"))
