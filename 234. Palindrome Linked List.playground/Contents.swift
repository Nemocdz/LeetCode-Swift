import Cocoa

/*
 请判断一个链表是否为回文链表。
 
 示例 1:
 
 输入: 1->2
 输出: false
 示例 2:
 
 输入: 1->2->2->1
 输出: true
 进阶：
 你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题？
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
    func isPalindrome(_ head: ListNode?) -> Bool {
        let midNode: ListNode? = {
            var slow = head
            var fast = head
            while fast != nil {
                slow = slow?.next
                fast = fast?.next?.next
            }
            return slow
        }()
        
        func reverse(_ head: ListNode?) -> ListNode? {
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
        
        var head = head
        var tail = reverse(midNode)
        
        while tail != nil {
            if tail?.val != head?.val {
                return false
            }
            head = head?.next
            tail = tail?.next
        }
        
        return true
    }
}

