import UIKit

//Given the root of a binary tree, the level of its root is 1, the level of its children is 2, and so on.
//
//Return the smallest level x such that the sum of all the values of nodes at level x is maximal.
//
// 
//
//Example 1:
//
//
//Input: root = [1,7,0,7,-8,null,null]
//Output: 2
//Explanation:
//Level 1 sum = 1.
//Level 2 sum = 7 + 0 = 7.
//Level 3 sum = 7 + -8 = -1.
//So we return the level with the maximum sum which is level 2.
//Example 2:
//
//Input: root = [989,null,10250,98693,-89388,null,null,null,-32127]
//Output: 2
// 
//
//Constraints:
//
//The number of nodes in the tree is in the range [1, 104].
//-105 <= Node.val <= 105

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func maxLevelSum(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var queue: [TreeNode] = [root]
        var maxSum = Int.min
        var maxLevel = 0
        var currentLevel = 0
        while !queue.isEmpty {
            let size = queue.count
            var sum: Int = 0
            currentLevel += 1
            for _ in 0..<size {
                let node = queue.removeFirst()
                sum += node.val
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
            if sum > maxSum {
                maxSum = sum
                maxLevel = currentLevel
            }
        }
        
        return maxLevel
    }
}

let solution = Solution()
print(solution.maxLevelSum(TreeNode(1, TreeNode(7, TreeNode(7), TreeNode(-8)), TreeNode(0))))
