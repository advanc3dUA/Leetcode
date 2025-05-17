import UIKit

//Consider all the leaves of a binary tree, from left to right order, the values of those leaves form a leaf value sequence.
//
//
//
//For example, in the given tree above, the leaf value sequence is (6, 7, 4, 9, 8).
//
//Two binary trees are considered leaf-similar if their leaf value sequence is the same.
//
//Return true if and only if the two given trees with head nodes root1 and root2 are leaf-similar.
//
// 
//
//Example 1:
//
//
//Input: root1 = [3,5,1,6,2,9,8,null,null,7,4], root2 = [3,5,1,6,7,4,2,null,null,null,null,null,null,9,8]
//Output: true
//Example 2:
//
//
//Input: root1 = [1,2,3], root2 = [1,3,2]
//Output: false
// 
//
//Constraints:
//
//The number of nodes in each tree will be in the range [1, 200].
//Both of the given trees will have values in the range [0, 200].

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
    func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
        let list1 = dfs(root1)
        let list2 = dfs(root2)
        
        return list1 == list2
    }
    
    func dfs(_ node: TreeNode?) -> [Int] {
        guard let node = node else {
            return []
        }
        
        if node.left == nil && node.right == nil {
            return [node.val]
        }
        
        return dfs(node.left) + dfs(node.right)
    }
}

let solution = Solution()
print(solution.dfs(TreeNode(3, TreeNode(5, TreeNode(6), TreeNode(2, TreeNode(7), TreeNode(4))), TreeNode(1, TreeNode(9), TreeNode(8)))))

print(solution.leafSimilar(TreeNode(3, TreeNode(5, TreeNode(6), TreeNode(2, TreeNode(7), TreeNode(4))), TreeNode(1, TreeNode(9), TreeNode(8))), TreeNode(3, TreeNode(5, TreeNode(6), TreeNode(2, TreeNode(7), TreeNode(4))), TreeNode(1, TreeNode(9), TreeNode(8)))))
