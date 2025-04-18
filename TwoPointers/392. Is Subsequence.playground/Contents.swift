import UIKit

//Given two strings s and t, return true if s is a subsequence of t, or false otherwise.
//
//A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).
//
// 
//
//Example 1:
//
//Input: s = "abc", t = "ahbgdc"
//Output: true
//Example 2:
//
//Input: s = "axc", t = "ahbgdc"
//Output: false
// 
//
//Constraints:
//
//0 <= s.length <= 100
//0 <= t.length <= 104
//s and t consist only of lowercase English letters.
// 
//
//Follow up: Suppose there are lots of incoming s, say s1, s2, ..., sk where k >= 109, and you want to check one by one to see if t has its subsequence. In this scenario, how would you change your code?

//class Solution {
//    func isSubsequence(_ s: String, _ t: String) -> Bool {
//        var tStartingIndex = 0
//        let sArray = Array(s)
//        let tArray = Array(t)
//        
//        for sIndex in 0..<sArray.count {
//            if tStartingIndex > t.count - 1 {
//                return false
//            }
//            
//            for tIndex in tStartingIndex..<tArray.count {
//                if sArray[sIndex] == tArray[tIndex] {
//                    tStartingIndex = tIndex + 1
//                    break
//                } else if tIndex == tArray.count - 1 {
//                    return false
//                }
//            }
//        }
//        return true
//    }
//}

class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        var i = s.startIndex
        var j = t.startIndex
        
        while i < s.endIndex && j < t.endIndex {
            if s[i] == t[j] {
                i = s.index(after: i)
            }
            j = t.index(after: j)
        }
        return i == s.endIndex
    }
}


let solution = Solution()
print(solution.isSubsequence("abc", "ahbgdc"))
print(solution.isSubsequence("axc", "ahbgdc"))
print(solution.isSubsequence("aaaaaa", "bbaaaa"))
