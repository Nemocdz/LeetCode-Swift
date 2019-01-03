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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var length = 0
        var current = head
        var pre:ListNode? = nil
        var result:ListNode? = nil
        var last:ListNode? = nil
        while current != nil {
            length += 1
            if length % 2 == 0 {
                let next = current?.next
                current?.next = pre
                pre?.next = next
                last?.next = current
                if result == nil {
                    result = current
                }
                last = pre
                let temp = current
                current = pre
                pre = temp
            }
            pre = current
            current = current?.next
        }
        return length > 1 ? result : head
    }
}
