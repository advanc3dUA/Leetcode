import UIKit

//Given the root of a binary tree and an integer targetSum, return the number of paths where the sum of the values along the path equals targetSum.
//
//The path does not need to start or end at the root or a leaf, but it must go downwards (i.e., traveling only from parent nodes to child nodes).
//
// 
//
//Example 1:
//
//
//Input: root = [10,5,-3,3,2,null,11,3,-2,null,1], targetSum = 8
//Output: 3
//Explanation: The paths that sum to 8 are shown.
//Example 2:
//
//Input: root = [5,4,8,11,null,13,4,7,2,null,null,5,1], targetSum = 22
//Output: 3
// 
//
//Constraints:
//
//The number of nodes in the tree is in the range [0, 1000].
//-109 <= Node.val <= 109
//-1000 <= targetSum <= 1000

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
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> Int {
        guard let node = root else {
            return 0
        }
        return countFrom(root, targetSum) + pathSum(node.left, targetSum) + pathSum(node.right, targetSum)
    }
    
    func countFrom(_ node: TreeNode?, _ remaining: Int) -> Int {
        guard let node = node else {
            return 0
        }
        
        var count = 0
        if node.val == remaining {
            count += 1
        }
        
        count += countFrom(node.left, remaining - node.val)
        count += countFrom(node.right, remaining - node.val)
        
        return count
    }
}
