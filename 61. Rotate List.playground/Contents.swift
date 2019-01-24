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
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }
        let n = k % head.size
        var result = head
        for _ in 0..<n {
            result = roateRight(result)
        }
        return result
    }
    
    func roateRight(_ head: ListNode) -> ListNode{
        if head.next == nil {
            return head
        }
        var current = head
        var pre: ListNode? = nil
        while let next = current.next {
            pre = current
            current = next
        }
        current.next = head
        pre?.next = nil
        return current
    }
}

extension ListNode{
    var size:Int{
        var temp:ListNode? = self
        var result = 1
        while temp?.next != nil {
            result += 1
            temp = temp?.next
        }
        return result
    }
}
