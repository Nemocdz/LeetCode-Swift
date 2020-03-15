import Cocoa

/*
 反转从位置 m 到 n 的链表。请使用一趟扫描完成反转。
 
 说明:
 1 ≤ m ≤ n ≤ 链表长度。
 
 示例:
 
 输入: 1->2->3->4->5->NULL, m = 2, n = 4
 输出: 1->4->3->2->5->NULL
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
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        if m == 1 {
            var next:ListNode? = nil
            
            func reverseList(_ head: ListNode?, _ n:Int) -> ListNode? {
                if n == 1 {
                    next = head?.next
                    return head
                }
                
                let last = reverseList(head?.next, n - 1)
                head?.next?.next = head
                head?.next = next
                return last
            }
            
            return reverseList(head, n)
        }
        
        head?.next = reverseBetween(head?.next, m - 1, n - 1)
        return head
    }
}
