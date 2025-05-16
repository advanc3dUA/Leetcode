import UIKit

//Given the root of a binary tree, return its maximum depth.
//
//A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
//
//
//
//Example 1:
//
//
//Input: root = [3,9,20,null,null,15,7]
//Output: 3
//Example 2:
//
//Input: root = [1,null,2]
//Output: 2
//
//
//Constraints:
//
//The number of nodes in the tree is in the range [0, 104].
//-100 <= Node.val <= 100

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
//class Solution {
//    func maxDepth(_ root: TreeNode?) -> Int {
//        guard let root = root else {
//            return 0
//        }
//
//        let left = maxDepth(root.left)
//        let right = maxDepth(root.right)
//
//        return 1 + max(left, right)
//    }
//}

class Solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        
        var stack: [(TreeNode, Int)] = [(root, 1)]
        var maxDepth = 0
        
        while !stack.isEmpty {
            let (node, depth) = stack.removeLast()
            maxDepth = max(maxDepth, depth)
            
            if let left = node.left {
                stack.append((left, depth + 1))
            }
            if let right = node.right {
                stack.append((right, depth + 1))
            }
        }
        
        return maxDepth
    }
}

let solution = Solution()
print(solution.maxDepth(TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))))
