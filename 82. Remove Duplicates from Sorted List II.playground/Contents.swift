import Cocoa

/*
 给定一个排序链表，删除所有含有重复数字的节点，只保留原始链表中 没有重复出现 的数字。
 
 示例 1:
 
 输入: 1->2->3->3->4->4->5
 输出: 1->2->5
 示例 2:
 
 输入: 1->1->1->2->3
 输出: 2->3
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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if head == nil {
            return nil
        }
        
        let fake = ListNode(-1)
        fake.next = head
        
        var slow:ListNode? = fake
        var fast = head
        
        while fast != nil {
            if fast?.val != fast?.next?.val {
                if slow?.next === fast {
                    slow = fast
                } else {
                    slow?.next = fast?.next
                }
            }
            fast = fast?.next
        }
        return fake.next
    }
}
