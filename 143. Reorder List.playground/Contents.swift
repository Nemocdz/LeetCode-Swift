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
