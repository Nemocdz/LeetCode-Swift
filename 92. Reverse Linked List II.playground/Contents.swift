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
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        let newHead = ListNode(-1)
        newHead.next = head
        var index = 0
        var current:ListNode? = newHead
        var before = newHead
        var after:ListNode?
        var subHead:ListNode?
        while current != nil {
            if index == m - 1 {
                before = current!
                subHead = current!.next
            } else if index == n {
                after = current!.next
                current?.next = nil
            }
            current = current?.next
            index += 1
        }
        
        let reverseHead = reverse(subHead)
        current = reverseHead
        while current?.next != nil {
            current = current?.next
        }
        
        current?.next = after
        before.next = reverseHead
        return newHead.next
    }
    
    func reverse(_ head: ListNode?) -> ListNode? {
        guard var head = head else {
            return nil
        }
        let current = head
        while let next = current.next {
            current.next = next.next
            next.next = head
            head = next
        }
        return head
    }
}
