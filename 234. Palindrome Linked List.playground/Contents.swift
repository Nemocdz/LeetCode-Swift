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
        let middle = middleNode(head)
        var head = head
        var tail = reverseList(middle)
        var result = true
        while let tailNext = tail?.next {
            guard tail!.val == head!.val else {
                result = false
                break
            }
            tail = tailNext
            head = head?.next
        }
        return result
    }
    
    func middleNode(_ head: ListNode?) -> ListNode? {
        var totalCount = 0
        var temp = head
        while let next = temp?.next {
            totalCount += 1
            temp = next
        }
        
        var halfCount = totalCount / 2
        var middle = head
        while halfCount > 0 {
            halfCount -= 1
            middle = middle?.next
        }
        
        return middle
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
}

