import Cocoa

/**
 * Definition for singly-linked list.
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

let a = ListNode(6)
a.next = ListNode(3)
a.next?.next = ListNode(6)
 
class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }
        head.next = removeElements(head.next, val)
        return head.val == val ? head.next : head
    }
}

Solution().removeElements(a, 6)
