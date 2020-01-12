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
        let fake = ListNode(-1)
        var temp = fake
        var l1 = l1
        var l2 = l2
        
        while l1 != nil || l2 != nil {
            if l1 == nil {
                temp.next = ListNode(l2!.val)
                l2 = l2?.next
            } else if l2 == nil {
                temp.next = ListNode(l1!.val)
                l1 = l1?.next
            } else {
                if l1!.val < l2!.val {
                    temp.next = ListNode(l1!.val)
                    l1 = l1?.next
                } else {
                    temp.next = ListNode(l2!.val)
                    l2 = l2?.next
                }
            }
            temp = temp.next!
        }
        
        return fake.next
    }
}

Solution().mergeTwoLists(a, b)
