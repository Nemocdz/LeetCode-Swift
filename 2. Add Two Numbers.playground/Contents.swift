import Cocoa

/*
 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
 
 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
 
 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 
 示例：
 
 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
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

let a = ListNode(0)
let b = ListNode(0)
 
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let fake = ListNode(-1)
        var temp = fake
        var l1 = l1
        var l2 = l2
        var carry = false
    
        while l1 != nil || l2 != nil {
            let a = l1?.val ?? 0
            let b = l2?.val ?? 0
            
            let sum = a + b + (carry ? 1 : 0)
            carry = sum >= 10
            temp.next = ListNode(sum % 10)
            
            l1 = l1?.next
            l2 = l2?.next
            temp = temp.next!
        }
        
        if carry {
            temp.next = ListNode(1)
        }
        
        return fake.next
    }
}

