import UIKit

//Given the head of a singly linked list, reverse the list, and return the reversed list.
//
// 
//
//Example 1:
//
//
//Input: head = [1,2,3,4,5]
//Output: [5,4,3,2,1]
//Example 2:
//
//
//Input: head = [1,2]
//Output: [2,1]
//Example 3:
//
//Input: head = []
//Output: []
// 
//
//Constraints:
//
//The number of nodes in the list is the range [0, 5000].
//-5000 <= Node.val <= 5000

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() {
        self.val = 0
        self.next = nil
    }
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

//class Solution {
//    func reverseList(_ head: ListNode?) -> ListNode? {
//        guard let head = head, let next = head.next else {
//            return head
//        }
//        
//        let newHead = reverseList(head.next)
//        next.next = head
//        head.next = nil
//        return newHead
//    }
//}

class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode?
        var curr: ListNode? = head
        
        while curr != nil {
            let next = curr?.next
            curr?.next = prev
            
            prev = curr
            curr = next
        }
        
        return prev
    }
}
