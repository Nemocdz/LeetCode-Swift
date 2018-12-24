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
 
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var slow = head
        var fast = head
        for _ in 0..<n {
            fast = fast?.next
        }
        
        if fast == nil {
            return head?.next
        }
        
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next
        }
        slow?.next = slow?.next?.next
        
        return head
    }
}
