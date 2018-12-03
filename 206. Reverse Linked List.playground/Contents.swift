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
}
