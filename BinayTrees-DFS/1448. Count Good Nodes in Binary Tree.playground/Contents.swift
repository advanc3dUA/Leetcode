import UIKit

//Given a binary tree root, a node X in the tree is named good if in the path from root to X there are no nodes with a value greater than X.
//
//Return the number of good nodes in the binary tree.
//
// 
//
//Example 1:
//
//
//
//Input: root = [3,1,4,3,null,1,5]
//Output: 4
//Explanation: Nodes in blue are good.
//Root Node (3) is always a good node.
//Node 4 -> (3,4) is the maximum value in the path starting from the root.
//Node 5 -> (3,4,5) is the maximum value in the path
//Node 3 -> (3,1,3) is the maximum value in the path.
//Example 2:
//
//
//
//Input: root = [3,3,null,4,2]
//Output: 3
//Explanation: Node 2 -> (3, 3, 2) is not good, because "3" is higher than it.
//Example 3:
//
//Input: root = [1]
//Output: 1
//Explanation: Root is considered as good.
// 
//
//Constraints:
//
//The number of nodes in the binary tree is in the range [1, 10^5].
//Each node's value is between [-10^4, 10^4].

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
    func goodNodes(_ root: TreeNode?) -> Int {
        return dfs(root)
    }
    
    func dfs(_ node: TreeNode?, _ currentMax: Int = Int.min) -> Int {
        guard let node = node else {
            return 0
        }
        
//        if node.val >= currentMax {
//            return 1 + dfs(node.left, node.val) + dfs(node.right, node.val)
//        } else {
//            return dfs(node.left, currentMax) + dfs(node.right, currentMax)
//        }
        let isGood = node.val >= currentMax ? 1 : 0
        let newMax = max(currentMax, node.val)
        
        return isGood + dfs(node.left, newMax) + dfs(node.right, newMax)
    }
}

let solution = Solution()
print(solution.dfs(TreeNode(3, TreeNode(1, TreeNode(3), TreeNode()), TreeNode(4, TreeNode(1), TreeNode(5)))))
