import Cocoa

/*
 给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。
 
 示例：
 
 给定一个链表: 1->2->3->4->5, 和 n = 2.
 
 当删除了倒数第二个节点后，链表变为 1->2->3->5.
 说明：
 
 给定的 n 保证是有效的。
 
 进阶：
 
 你能尝试使用一趟扫描实现吗？
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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let fake:ListNode? = ListNode(-1)
        fake?.next = head
        
        var fast = fake
        var slow = fake
        
        var i = 0
        while fast?.next != nil {
            if i >= n {
                slow = slow?.next
            }
            fast = fast?.next
            i += 1
        }
        
        slow?.next = slow?.next?.next
        return fake?.next
    }
}
