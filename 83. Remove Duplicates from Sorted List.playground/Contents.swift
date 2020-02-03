import Cocoa

/*
 给定一个排序链表，删除所有重复的元素，使得每个元素只出现一次。
 
 示例 1:
 
 输入: 1->1->2
 输出: 1->2
 示例 2:
 
 输入: 1->1->2->3->3
 输出: 1->2->3
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
    
    public init(_ array: [Int]){
        self.val = array.first!
        self.next = nil
        var pre = self
        for value in array.dropFirst(){
            let current = ListNode(value)
            pre.next = current
            pre = current
        }
    }
 }


let a  = ListNode([1, 1, 2, 3, 3])

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        
        let fake = ListNode(-1)
        fake.next = head
        
        var slow:ListNode? = fake
        var fast = head
        
        while fast != nil {
            if fast?.val == fast?.next?.val {
                slow?.next = fast?.next
            } else {
                slow = slow?.next
            }
            fast = fast?.next
        }
        return fake.next
    }
}

Solution().deleteDuplicates(a)
