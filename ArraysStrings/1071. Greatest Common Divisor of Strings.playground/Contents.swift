import UIKit

//For two strings s and t, we say "t divides s" if and only if s = t + t + t + ... + t + t (i.e., t is concatenated with itself one or more times).
//
//Given two strings str1 and str2, return the largest string x such that x divides both str1 and str2.
//
// 
//
//Example 1:
//
//Input: str1 = "ABCABC", str2 = "ABC"
//Output: "ABC"
//Example 2:
//
//Input: str1 = "ABABAB", str2 = "ABAB"
//Output: "AB"
//Example 3:
//
//Input: str1 = "LEET", str2 = "CODE"
//Output: ""
// 
//
//Constraints:
//
//1 <= str1.length, str2.length <= 1000
//str1 and str2 consist of English uppercase letters.

let str1 = "ABABAB"
let str2 = "ABAB"
//let str1 = "LEET"
//let str2 = "CODE"

class Solution {
    func gcdOfStrings(_ str1: String, _ str2: String) -> String {
        if str1 + str2 == str2 + str1 {
            for n in (1...min(str1.count, str2.count)).reversed() {
                if str1.count % n == 0 && str2.count % n == 0 {
                    return String(str1.prefix(n))
                }
            }
        }
        return ""
    }
}

let solution = Solution()
print(solution.gcdOfStrings(str1, str2))
