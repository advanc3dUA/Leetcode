import UIKit

//Given an encoded string, return its decoded string.
//
//The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is being repeated exactly k times. Note that k is guaranteed to be a positive integer.
//
//You may assume that the input string is always valid; there are no extra white spaces, square brackets are well-formed, etc. Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, k. For example, there will not be input like 3a or 2[4].
//
//The test cases are generated so that the length of the output will never exceed 105.
//
// 
//
//Example 1:
//
//Input: s = "3[a]2[bc]"
//Output: "aaabcbc"
//Example 2:
//
//Input: s = "3[a2[c]]"
//Output: "accaccacc"
//Example 3:
//
//Input: s = "2[abc]3[cd]ef"
//Output: "abcabccdcdcdef"
// 
//
//Constraints:
//
//1 <= s.length <= 30
//s consists of lowercase English letters, digits, and square brackets '[]'.
//s is guaranteed to be a valid input.
//All the integers in s are in the range [1, 300].

class Solution {
    func decodeString(_ s: String) -> String {
        var stack: [(String, Int)] = []
        var currentString = ""
        var currentMultiplier = ""
        
        for i in 0..<s.count {
            let symbol = s[s.index(s.startIndex, offsetBy: i)]
            
            if symbol.isNumber {
                currentMultiplier += String(symbol)
            } else if symbol.isLetter {
                currentString += String(symbol)
            } else if symbol == "[" {
                let pair: (String, Int) = (currentString, Int(currentMultiplier) ?? 1)
                stack.append(pair)
                currentString = ""
                currentMultiplier = ""
            } else if symbol == "]" {
                let (prevString, prevMultiplier) = stack.removeLast()
                currentString = prevString + String(repeating: currentString, count: prevMultiplier)
            }
        }
        return currentString
    }
}

let solution = Solution()
print(solution.decodeString("3[a]2[bc]"))
print(solution.decodeString("2[abc]3[cd]ef"))
print(solution.decodeString("3[a2[c]]"))
