import UIKit

//Given a root node reference of a BST and a key, delete the node with the given key in the BST. Return the root node reference (possibly updated) of the BST.
//
//Basically, the deletion can be divided into two stages:
//
//Search for a node to remove.
//If the node is found, delete the node.
// 
//
//Example 1:
//
//
//Input: root = [5,3,6,2,4,null,7], key = 3
//Output: [5,4,6,2,null,null,7]
//Explanation: Given key to delete is 3. So we find the node with value 3 and delete it.
//One valid answer is [5,4,6,2,null,null,7], shown in the above BST.
//Please notice that another valid answer is [5,2,6,null,4,null,7] and it's also accepted.
//
//Example 2:
//
//Input: root = [5,3,6,2,4,null,7], key = 0
//Output: [5,3,6,2,4,null,7]
//Explanation: The tree does not contain a node with value = 0.
//Example 3:
//
//Input: root = [], key = 0
//Output: []
// 
//
//Constraints:
//
//The number of nodes in the tree is in the range [0, 104].
//-105 <= Node.val <= 105
//Each node has a unique value.
//root is a valid binary search tree.
//-105 <= key <= 105

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
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        guard let node = root else { return nil }
        
        if key < node.val {
            node.left = deleteNode(node.left, key)
        } else if key > node.val {
            node.right = deleteNode(node.right, key)
        } else {
            if node.left == nil && node.right == nil {
                return nil
            }
            
            if node.left == nil {
                return node.right
            }
            
            if node.right == nil {
                return node.left
            }
            
            if let minNode = findMin(node.right) {
                node.val = minNode.val
                node.right = deleteNode(node.right, minNode.val)
            }
        }
        return root
    }
    
    func findMin(_ node: TreeNode?) -> TreeNode? {
        var current = node
        while current?.left != nil {
            current = current?.left
        }
        return current
    }
}

let solution = Solution()
print(solution.deleteNode(TreeNode(5, TreeNode(3, TreeNode(2), TreeNode(4)), TreeNode(6, nil, TreeNode(7))), 3))
