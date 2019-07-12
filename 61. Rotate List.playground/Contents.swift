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
        guard let head = head else {
            return nil
        }
        let n = k % head.size
        var result = head
        for _ in 0..<n {
            result = roateRight(result)
        }
        return result
    }
    
    func roateRight(_ head: ListNode) -> ListNode{
        if head.next == nil {
            return head
        }
        var current = head
        var pre: ListNode? = nil
        while let next = current.next {
            pre = current
            current = next
        }
        current.next = head
        pre?.next = nil
        return current
    }
}

extension ListNode{
    var size:Int{
        var temp:ListNode? = self
        var result = 1
        while temp?.next != nil {
            result += 1
            temp = temp?.next
        }
        return result
    }
}
