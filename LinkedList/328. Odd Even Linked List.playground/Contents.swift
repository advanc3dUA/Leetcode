import UIKit

//Given the head of a singly linked list, group all the nodes with odd indices together followed by the nodes with even indices, and return the reordered list.
//
//The first node is considered odd, and the second node is even, and so on.
//
//Note that the relative order inside both the even and odd groups should remain as it was in the input.
//
//You must solve the problem in O(1) extra space complexity and O(n) time complexity.
//
// 
//
//Example 1:
//
//
//Input: head = [1,2,3,4,5]
//Output: [1,3,5,2,4]
//Example 2:
//
//
//Input: head = [2,1,3,5,6,4,7]
//Output: [2,3,6,7,1,5,4]
// 
//
//Constraints:
//
//The number of nodes in the linked list is in the range [0, 104].
//-106 <= Node.val <= 106

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        
        var count = 0
        var current: ListNode? = head
        var oddTail: ListNode?
        var evenTail: ListNode?
        var evenHead: ListNode?
        var oddHead: ListNode?
        
        while current != nil {
            if count % 2 == 0 {
                if evenHead == nil {
                    evenHead = current
                    evenTail = evenHead
                } else {
                    evenTail?.next = current
                    evenTail = current
                }
            } else {
                if oddHead == nil {
                    oddHead = current
                    oddTail = oddHead
                } else {
                    oddTail?.next = current
                    oddTail = current
                }
            }
            
            current = current?.next
            count += 1
        }
        
        evenTail?.next = oddHead
        oddTail?.next = nil
        return evenHead
    }
}

let solution = Solution()
let head: ListNode? = ListNode(10, ListNode(11, ListNode(12, ListNode(13, ListNode(14, ListNode(15))))))
let result = solution.oddEvenList(head)
print("result: \(String(describing: result))")



