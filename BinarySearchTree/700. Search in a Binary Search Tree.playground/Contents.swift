import UIKit

//You are given the root of a binary search tree (BST) and an integer val.
//
//Find the node in the BST that the node's value equals val and return the subtree rooted with that node. If such a node does not exist, return null.
//
// 
//
//Example 1:
//
//
//Input: root = [4,2,7,1,3], val = 2
//Output: [2,1,3]
//Example 2:
//
//
//Input: root = [4,2,7,1,3], val = 5
//Output: []
// 
//
//Constraints:
//
//The number of nodes in the tree is in the range [1, 5000].
//1 <= Node.val <= 107
//root is a binary search tree.
//1 <= val <= 107

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
    
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let node = root else { return nil }
        if node.val == val {
            return node
        }
        
        return val < node.val ? searchBST(node.left, val) : searchBST(node.right, val)
    }
}

let solution = Solution()
print(solution.searchBST(TreeNode(4, TreeNode(3, TreeNode(1), TreeNode(2)), TreeNode(7)), 2))
