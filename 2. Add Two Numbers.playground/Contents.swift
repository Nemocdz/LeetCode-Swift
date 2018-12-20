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

let a = ListNode(0)
let b = ListNode(0)
 
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let result = ListNode(0)
        var l1 = l1
        var l2 = l2
        var current = result
        var carry = 0
        
        while l1 != nil || l2 != nil {
            let x = l1?.val ?? 0
            let y = l2?.val ?? 0
            let sum = x + y + carry
            carry = sum / 10
            current.next = ListNode(sum % 10)
            current = current.next!
            if l1 != nil {
                l1 = l1!.next
            }
            if l2 != nil {
                l2 = l2!.next
            }
        }
        
        if carry > 0 {
            current.next = ListNode(carry)
        }
        
        return result.next
    }
}

