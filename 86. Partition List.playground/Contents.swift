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
        let littleHead = ListNode(-1)
        let bigHead =  ListNode(-1)
        var current = head
        var littleCurrent = littleHead
        var bigCurrent = bigHead
        while current != nil {
            if current!.val >= x {
                bigCurrent.next = current
                bigCurrent = current!
            } else {
                littleCurrent.next = current
                littleCurrent = current!
            }
            current = current!.next
        }
        
        bigCurrent.next = nil
        littleCurrent.next = bigHead.next
        return littleHead.next
    }
}

Solution().partition(a, 3)
