import UIKit

class Solution {
    let word1 = "ab"
    let word2 = "pqqq"
    
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        var result = ""
        let maxCount = max(word1.count, word2.count)
        
        for number in 0..<maxCount {
            if number < word1.count {
                let index1 = word1.index(word1.startIndex, offsetBy: number)
                result += String(word1[index1])
            }
            
            if number < word2.count {
                let index2 = word2.index(word2.startIndex, offsetBy: number)
                result += String(word2[index2])
            }
        }
        return result
    }
}

let solution = Solution()
print(solution.mergeAlternately(solution.word1, solution.word2))
