import UIKit

//There are n cities. Some of them are connected, while some are not. If city a is connected directly with city b, and city b is connected directly with city c, then city a is connected indirectly with city c.
//
//A province is a group of directly or indirectly connected cities and no other cities outside of the group.
//
//You are given an n x n matrix isConnected where isConnected[i][j] = 1 if the ith city and the jth city are directly connected, and isConnected[i][j] = 0 otherwise.
//
//Return the total number of provinces.
//
// 
//
//Example 1:
//
//
//Input: isConnected = [[1,1,0],[1,1,0],[0,0,1]]
//Output: 2
//Example 2:
//
//
//Input: isConnected = [[1,0,0],[0,1,0],[0,0,1]]
//Output: 3
// 
//
//Constraints:
//
//1 <= n <= 200
//n == isConnected.length
//n == isConnected[i].length
//isConnected[i][j] is 1 or 0.
//isConnected[i][i] == 1
//isConnected[i][j] == isConnected[j][i]

class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        let cityNumber = isConnected.count
        var visited: Set<Int> = []
        var provinceCount = 0
        
        for i in 0..<cityNumber {
            if !visited.contains(i) {
                provinceCount += 1
                dfs(for: i, isConnected , &visited)
            }
        }
        
        return provinceCount
    }
    
    func dfs(for i: Int, _ isConnected: [[Int]], _ visited: inout Set<Int>) {
        visited.insert(i)
        for j in 0..<isConnected[i].count {
            if isConnected[i][j] == 1 && !visited.contains(j) {
                visited.insert(j)
                dfs(for: j, isConnected, &visited)
            }
        }
    }
}

let solution = Solution()
let isConnected = [[1,1,0],[1,1,0],[0,0,1]]
print(solution.findCircleNum(isConnected))
