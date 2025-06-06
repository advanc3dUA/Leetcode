import UIKit

//Two strings are considered close if you can attain one from the other using the following operations:
//
//Operation 1: Swap any two existing characters.
//For example, abcde -> aecdb
//Operation 2: Transform every occurrence of one existing character into another existing character, and do the same with the other character.
//For example, aacabb -> bbcbaa (all a's turn into b's, and all b's turn into a's)
//You can use the operations on either string as many times as necessary.
//
//Given two strings, word1 and word2, return true if word1 and word2 are close, and false otherwise.
//
// 
//
//Example 1:
//
//Input: word1 = "abc", word2 = "bca"
//Output: true
//Explanation: You can attain word2 from word1 in 2 operations.
//Apply Operation 1: "abc" -> "acb"
//Apply Operation 1: "acb" -> "bca"
//Example 2:
//
//Input: word1 = "a", word2 = "aa"
//Output: false
//Explanation: It is impossible to attain word2 from word1, or vice versa, in any number of operations.
//Example 3:
//
//Input: word1 = "cabbba", word2 = "abbccc"
//Output: true
//Explanation: You can attain word2 from word1 in 3 operations.
//Apply Operation 1: "cabbba" -> "caabbb"
//Apply Operation 2: "caabbb" -> "baaccc"
//Apply Operation 2: "baaccc" -> "abbccc"
// 
//
//Constraints:
//
//1 <= word1.length, word2.length <= 105
//word1 and word2 contain only lowercase English letters.

class Solution {
    func closeStrings(_ word1: String, _ word2: String) -> Bool {
        guard word1.count == word2.count else { return false }
        var word1Freq: [Character: Int] = [:]
        var word2Freq: [Character: Int] = [:]
        
        for char in word1 {
            word1Freq[char, default: 0] += 1
        }
        
        for char in word2 {
            word2Freq[char, default: 0] += 1
        }
        
        guard Set(word1Freq.keys) == Set(word2Freq.keys) else { return false }
        
        return word1Freq.values.sorted() == word2Freq.values.sorted()
    }
}

let solution = Solution()
print(solution.closeStrings("abc", "bca"))
print(solution.closeStrings("a", "aa"))
print(solution.closeStrings("cabbba", "abbccc"))
print(solution.closeStrings("uau", "ssx"))
