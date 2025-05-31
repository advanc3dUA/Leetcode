import UIKit

//There are n cities numbered from 0 to n - 1 and n - 1 roads such that there is only one way to travel between two different cities (this network form a tree). Last year, The ministry of transport decided to orient the roads in one direction because they are too narrow.
//
//Roads are represented by connections where connections[i] = [ai, bi] represents a road from city ai to city bi.
//
//This year, there will be a big event in the capital (city 0), and many people want to travel to this city.
//
//Your task consists of reorienting some roads such that each city can visit the city 0. Return the minimum number of edges changed.
//
//It's guaranteed that each city can reach city 0 after reorder.
//
// 
//
//Example 1:
//
//
//Input: n = 6, connections = [[0,1],[1,3],[2,3],[4,0],[4,5]]
//Output: 3
//Explanation: Change the direction of edges show in red such that each node can reach the node 0 (capital).
//Example 2:
//
//
//Input: n = 5, connections = [[1,0],[1,2],[3,2],[3,4]]
//Output: 2
//Explanation: Change the direction of edges show in red such that each node can reach the node 0 (capital).
//Example 3:
//
//Input: n = 3, connections = [[1,0],[2,0]]
//Output: 0

class Solution {
    func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
        var graph = [[Int]](repeating: [], count: n)
        
        var directedEdges = Set<String>()
        for connection in connections {
            let from = connection[0]
            let to = connection[1]
            graph[from].append(to)
            graph[to].append(from)
            directedEdges.insert("\(from)->\(to)")
        }
        
        var count = 0
        
        func dfs(_ node: Int, _ parent: Int) {
            for neighbor in graph[node] {
                if neighbor == parent { continue }
                if directedEdges.contains("\(node)->\(neighbor)") {
                    count += 1
                }
                dfs(neighbor, node)
            }
        }
        
        dfs(0, -1)
        return count
    }
}

let solution = Solution()
print(solution.minReorder(6, [[0,1],[1,3],[2,3],[4,0],[4,5]]))
