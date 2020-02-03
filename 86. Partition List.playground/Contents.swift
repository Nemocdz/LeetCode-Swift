import Cocoa

/*
 给定一个链表和一个特定值 x，对链表进行分隔，使得所有小于 x 的节点都在大于或等于 x 的节点之前。
 
 你应当保留两个分区中每个节点的初始相对位置。
 
 示例:
 
 输入: head = 1->4->3->2->5->2, x = 3
 输出: 1->2->2->4->3->5
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

let a = ListNode([1, 4, 3, 2, 5, 2])
 
class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let small = ListNode(-1)
        let big = ListNode(-1)
        var temp = head
        var smallTemp:ListNode? = small
        var bigTemp:ListNode? = big
        while temp != nil {
            if temp!.val < x {
                smallTemp?.next = temp
                smallTemp = smallTemp?.next
            } else {
                bigTemp?.next = temp
                bigTemp = bigTemp?.next
            }
            
            temp = temp?.next
        }
        
        smallTemp?.next = big.next
        bigTemp?.next = nil
        
        return small.next
    }
}

Solution().partition(a, 3)
