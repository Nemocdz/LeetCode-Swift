import Cocoa

/*
 删除链表中等于给定值 val 的所有节点。
 
 示例:
 
 输入: 1->2->6->3->4->5->6, val = 6
 输出: 1->2->3->4->5
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

let a = ListNode(6)
a.next = ListNode(3)
a.next?.next = ListNode(6)
 
class Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }
        head.next = removeElements(head.next, val)
        return head.val == val ? head.next : head
    }
}

Solution().removeElements(a, 6)
