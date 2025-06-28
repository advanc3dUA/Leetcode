import UIKit

//Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.
//
//A mapping of digits to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.
//
//Example 1:
//
//Input: digits = "23"
//Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
//Example 2:
//
//Input: digits = ""
//Output: []
//Example 3:
//
//Input: digits = "2"
//Output: ["a","b","c"]
// 
//
//Constraints:
//
//0 <= digits.length <= 4
//digits[i] is a digit in the range ['2', '9'].

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else { return [] }
        
        let mapping: [Character: [Character]] = [
          "2": ["a","b","c"], "3": ["d","e","f"],
          "4": ["g","h","i"], "5": ["j","k","l"],
          "6": ["m","n","o"], "7": ["p","q","r","s"],
          "8": ["t","u","v"], "9": ["w","x","y","z"]
        ]
        
        var result = [String]()
        var path = [Character]()
        let chars = Array(digits)
        
        func dfs(_ index: Int) {
            if index == chars.count {
                result.append(String(path))
                return
            }
            let digit = chars[index]
            guard let letters = mapping[digit] else { return }
            for letter in letters {
                path.append(letter)
                dfs(index + 1)
                print(path)
                path.removeLast()
                print(path)
            }
        }
        
        dfs(0)
        return result
    }
}

let solution = Solution()
print(solution.letterCombinations("23"))
