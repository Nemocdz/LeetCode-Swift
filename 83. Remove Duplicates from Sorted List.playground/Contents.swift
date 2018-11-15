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


let a  = ListNode([1, 1, 2, 3, 3])

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        
        var iter = head
        var array = [head.val]
        while iter.next != nil {
            iter = iter.next!
            if iter.val != array.last! {
                array.append(iter.val)
            }
        }
        
        
        let result = ListNode(array.first!)
        iter = result
        for value in array.dropFirst(){
            let current = ListNode(value)
            iter.next = current
            iter = current
        }
        
        return result
    }
}


Solution().deleteDuplicates(a)
