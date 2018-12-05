import Cocoa

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

