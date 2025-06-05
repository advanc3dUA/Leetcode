import UIKit

//You are given an m x n grid where each cell can have one of three values:
//
//0 representing an empty cell,
//1 representing a fresh orange, or
//2 representing a rotten orange.
//Every minute, any fresh orange that is 4-directionally adjacent to a rotten orange becomes rotten.
//
//Return the minimum number of minutes that must elapse until no cell has a fresh orange. If this is impossible, return -1.
//
//
//
//Example 1:
//
//
//Input: grid = [[2,1,1],[1,1,0],[0,1,1]]
//Output: 4
//Example 2:
//
//Input: grid = [[2,1,1],[0,1,1],[1,0,1]]
//Output: -1
//Explanation: The orange in the bottom left corner (row 2, column 0) is never rotten, because rotting only happens 4-directionally.
//Example 3:
//
//Input: grid = [[0,2]]
//Output: 0
//Explanation: Since there are already no fresh oranges at minute 0, the answer is just 0.

class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var queue = [(Int, Int)]()
        var minutes = 0
        var fresh = 0
        let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
        var grid = grid
        
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == 2 {
                    queue.append((i, j))
                } else if grid[i][j] == 1 {
                    fresh += 1
                }
            }
        }
        
        while !queue.isEmpty && fresh > 0 {
            let size = queue.count
            for _ in 0..<size {
                let (r, c) = queue.removeFirst()
                for (dr, dc) in directions {
                    let nr = r + dr
                    let nc = c + dc
                    if nr >= 0 && nr < grid.count && nc >= 0 && nc < grid[0].count && grid[nr][nc] == 1 {
                        grid[nr][nc] = 2
                        fresh -= 1
                        queue.append((nr, nc))
                    }
                }
            }
            minutes += 1
        }
        
        return fresh == 0 ? minutes : -1
    }
}

let solution = Solution()
print(solution.orangesRotting([
    [2,1,1],
    [1,1,0],
    [0,1,1]
]))
