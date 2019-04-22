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
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        let fake = ListNode(-1)
        var current:ListNode? = head
        var pre:ListNode = fake
        var next:ListNode? = nil
        while let aCurrent = current {
            next = aCurrent.next
            while let preNext = pre.next, preNext.val < aCurrent.val{
                pre = preNext
            }
            aCurrent.next = pre.next
            pre.next = aCurrent
            pre = fake
            current = next
        }
        return fake.next
    }
}
