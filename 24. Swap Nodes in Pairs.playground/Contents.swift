import Cocoa

/*
 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。
 
 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
 
   
 
 示例:
 
 给定 1->2->3->4, 你应该返回 2->1->4->3.
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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let next = head?.next
        head?.next = swapPairs(next?.next)
        next?.next = head
        return next;
    }
}
