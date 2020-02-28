import Cocoa

/*
 在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序。
 
 示例 1:
 
 输入: 4->2->1->3
 输出: 1->2->3->4
 示例 2:
 
 输入: -1->5->3->4->0
 输出: -1->0->3->4->5
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
    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        let midNode: ListNode? = {
            var slow = head
            var fast = head?.next
            while fast != nil && fast?.next != nil {
                slow = slow?.next
                fast = fast?.next?.next
            }
            return slow
        }()
        
        func merge(_ left:ListNode?, _ right:ListNode?) -> ListNode? {
            if left == nil {
                return right
            }
            
            if right == nil {
                return left
            }
            
            if left!.val < right!.val {
                left?.next = merge(left?.next, right)
                return left
            } else {
                right?.next = merge(left, right?.next)
                return right
            }
        }
        
        let right = sortList(midNode?.next)
        midNode?.next = nil
        let left = sortList(head)
    
        return merge(left, right)
    }
}


