import UIKit

//Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.
//
// 
//
//Example 1:
//
//Input: root = [1,2,3,null,5,null,4]
//
//Output: [1,3,4]
//
//Explanation:
//
//
//
//Example 2:
//
//Input: root = [1,2,3,4,null,null,null,5]
//
//Output: [1,3,4,5]
//
//Explanation:
//
//
//
//Example 3:
//
//Input: root = [1,null,3]
//
//Output: [1,3]
//
//Example 4:
//
//Input: root = []
//
//Output: []
//
// 
//
//Constraints:
//
//The number of nodes in the tree is in the range [0, 100].
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

class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let node = root else { return [] }
        
        var result: [Int] = []
        var queue: [TreeNode] = [node]
        
        while !queue.isEmpty {
            let levelSize = queue.count
            var levelNodes : [Int] = []
            
            for _ in 0..<levelSize {
                let node = queue.removeFirst()
                levelNodes.append(node.val)
                
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let rigght = node.right {
                    queue.append(rigght)
                }
            }
            result.append(levelNodes.last!)
        }
        return result
    }
}

let solution = Solution()
print(solution.rightSideView(TreeNode(1, TreeNode(2, TreeNode(6), TreeNode(5)), TreeNode(3, nil, TreeNode(4)))))
