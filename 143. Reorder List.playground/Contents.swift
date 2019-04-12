import Cocoa

/*
Given a singly linked list L: L0→L1→…→Ln-1→Ln,
reorder it to: L0→Ln→L1→Ln-1→L2→Ln-2→…

You may not modify the values in the list's nodes, only nodes itself may be changed.
 */
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
    func reorderList(_ head: ListNode?) {
        var count = 0
        var temp = head
        while temp != nil {
            temp = temp?.next
            count += 1
        }
        
        let half = count % 2 == 0 ? count / 2 - 1 : count / 2
        
        count = 0
        temp = head
        while count < half {
            temp = temp?.next
            count += 1
        }
        
        func reverseList(_ head: ListNode?) -> ListNode? {
            guard var head = head else {
                return nil
            }
            
            let current = head
            while let next = current.next{
                current.next = next.next;
                next.next = head
                head = next
            }
            return head
        }
        
        var new = reverseList(temp?.next)
        
        
        temp?.next = nil
        
        temp = head
        
        while temp != nil || new != nil {
            if let a = temp {
                temp = temp?.next
                a.next = new
            }
            
            if let b = new {
                new = new?.next
                b.next = temp
            }
        }
    }
}
