 import Cocoa

/*
 给定一个单链表 L：L0→L1→…→Ln-1→Ln ，
 将其重新排列后变为： L0→Ln→L1→Ln-1→L2→Ln-2→…
 
 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
 
 示例 1:
 
 给定链表 1->2->3->4, 重新排列为 1->4->2->3.
 示例 2:
 
 给定链表 1->2->3->4->5, 重新排列为 1->5->2->4->3.
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
        // 找到中间节点
        let midNode: ListNode? = {
            var slow = head
            var fast = head?.next
            while fast != nil && fast?.next != nil {
                slow = slow?.next
                fast = fast?.next?.next
            }
            return slow
        }()
        
        func reverseList(_ head:ListNode?) -> ListNode? {
            var pre:ListNode? = nil
            var current = head
            while current != nil {
                let next = current?.next
                current?.next = pre
                pre = current
                current = next
            }
            return pre
        }

        var left = head
        var right = reverseList(midNode?.next)
        midNode?.next = nil
    
        while left != nil || right != nil {
            let leftNext = left?.next
            let rightNext = right?.next
            
            left?.next = right
            right?.next = leftNext
            
            left = leftNext
            right = rightNext
        }
    }
}
