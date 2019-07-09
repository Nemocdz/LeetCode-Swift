import Cocoa

/*
 将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 
 示例：
 
 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
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



let a = ListNode([1, 2, 4])
let b = ListNode([1, 3, 4])

class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1 == nil && l2 != nil {
            return l2
        } else if l1 != nil && l2 == nil {
            return l1
        } else if let l1 = l1, let l2 = l2 {
            let flag = l1.val < l2.val
            let head = flag ? ListNode(l1.val) : ListNode(l2.val)
            var a = flag ? l1.next : l1
            var b = flag ? l2 : l2.next
            var result = head
            while a != nil || b != nil {
                if a == nil {
                    result.next = ListNode(b!.val)
                    b = b!.next
                } else if b == nil {
                    result.next = ListNode(a!.val)
                    a = a!.next
                } else {
                    let flag = a!.val < b!.val
                    result.next = flag ? ListNode(a!.val) : ListNode(b!.val)
                    a = flag ? a!.next : a
                    b = flag ? b : b!.next
                }
                result = result.next!
            }
            return head
        } else {
            return nil
        }
    }
}

Solution().mergeTwoLists(a, b)
