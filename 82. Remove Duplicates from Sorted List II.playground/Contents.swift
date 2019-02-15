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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        
        let newHead = ListNode(-1)
        newHead.next = head
        var pre = newHead
        var current:ListNode? = head
        while current != nil {
            while current!.next != nil && current!.val == current!.next!.val {
                current = current!.next!
            }
            if pre.next! === current! {
                pre = pre.next!
            } else {
                pre.next = current!.next
            }
            current = current!.next
        }
        return newHead.next
    }
}
