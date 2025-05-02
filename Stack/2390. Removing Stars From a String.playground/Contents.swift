import UIKit

//You are given a string s, which contains stars *.
//
//In one operation, you can:
//
//Choose a star in s.
//Remove the closest non-star character to its left, as well as remove the star itself.
//Return the string after all stars have been removed.
//
//Note:
//
//The input will be generated such that the operation is always possible.
//It can be shown that the resulting string will always be unique.
// 
//
//Example 1:
//
//Input: s = "leet**cod*e"
//Output: "lecoe"
//Explanation: Performing the removals from left to right:
//- The closest character to the 1st star is 't' in "leet**cod*e". s becomes "lee*cod*e".
//- The closest character to the 2nd star is 'e' in "lee*cod*e". s becomes "lecod*e".
//- The closest character to the 3rd star is 'd' in "lecod*e". s becomes "lecoe".
//There are no more stars, so we return "lecoe".
//Example 2:
//
//Input: s = "erase*****"
//Output: ""
//Explanation: The entire string is removed, so we return an empty string.
// 
//
//Constraints:
//
//1 <= s.length <= 105
//s consists of lowercase English letters and stars *.
//The operation above can be performed on s.

//class Solution {
//    func removeStars(_ s: String) -> String {
//        var result = s
//        var starsIndexArray: [Int] = []
//        
//        for index in 0..<result.count {
//            let currentIndex = result.index(result.startIndex, offsetBy: index)
//            
//            if result[currentIndex] == "*" {
//                starsIndexArray.append(index)
//            }
//        }
//        for (index, _) in starsIndexArray.enumerated() {
//            var starIndex = result.index(result.startIndex, offsetBy: starsIndexArray[index])
//            if starsIndexArray[index] > 0 {
//                let prevIndex = result.index(result.startIndex, offsetBy: starsIndexArray[index] - 1)
//                if result[prevIndex] != "*" {
//                    result.remove(at: prevIndex)
//                    if index < starsIndexArray.count {
//                        for i in stride(from: index + 1, to: starsIndexArray.count, by: 1) {
//                            starsIndexArray[i] -= 1
//                        }
//                        
//                        starIndex = result.index(result.startIndex, offsetBy: starsIndexArray[index] - 1)
//                    }
//                }
//            }
//            result.remove(at: starIndex)
//            if index < starsIndexArray.count {
//                for i in stride(from: index + 1, to: starsIndexArray.count, by: 1) {
//                    starsIndexArray[i] -= 1
//                }
//            }
//        }
//        
//        return result
//    }
//}

//class Solution {
//    func removeStars(_ s: String) -> String {
//        var stack = ""
//        for char in s {
//            if char != "*" {
//                stack.append(char)
//            } else {
//                stack.removeLast()
//            }
//        }
//        return stack
//    }
//}

class Solution {
    func removeStars(_ s: String) -> String {
        var stack = ""
        for char in s {
            if char == "*" {
                if !stack.isEmpty {
                    stack.removeLast()
                }
            } else {
                stack.append(char)
            }
        }
        return stack
    }
}

let solution = Solution()
print(solution.removeStars("leet**cod*e"))


