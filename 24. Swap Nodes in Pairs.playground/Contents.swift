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
