import Cocoa

/*
 给定一个链表，旋转链表，将链表每个节点向右移动 k 个位置，其中 k 是非负数。
 
 示例 1:
 
 输入: 1->2->3->4->5->NULL, k = 2
 输出: 4->5->1->2->3->NULL
 解释:
 向右旋转 1 步: 5->1->2->3->4->NULL
 向右旋转 2 步: 4->5->1->2->3->NULL
 示例 2:
 
 输入: 0->1->2->NULL, k = 4
 输出: 2->0->1->NULL
 解释:
 向右旋转 1 步: 2->0->1->NULL
 向右旋转 2 步: 1->2->0->NULL
 向右旋转 3 步: 0->1->2->NULL
 向右旋转 4 步: 2->0->1->NULL
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
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        var tail = head
        var size = 1
        while let next = tail?.next {
            size += 1
            tail = next
        }
        tail?.next = head
        
        // new head = size - k % size
        // new tail = size - k % size - 1
        tail = head
        for _ in 0..<(size - k % size - 1) {
            tail = tail?.next
        }
        
        let newHead = tail?.next
        tail?.next = nil
        return newHead
    }
}
