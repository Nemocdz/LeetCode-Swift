import Cocoa

/*
 在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序。
 
 示例 1:
 
 输入: 4->2->1->3
 输出: 1->2->3->4
 示例 2:
 
 输入: -1->5->3->4->0
 输出: -1->0->3->4->5
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
    func sortList(_ head: ListNode?) -> ListNode? {
        guard let _ = head, let _ = head?.next else {
            return head
        }
        
        let fake = ListNode(-1)
        fake.next = head
        var step = 1
        let length = head!.length
        while step < length {
            var node = fake.next
            var tail = fake
            while let aNode = node {
                let (left,right) = aNode.split(at: step)
                node = right?.split(at: step).1
                tail = tail.merge(left, right)
            }
            step *= 2
        }
        
        return fake.next
    }
}

extension ListNode {
    var length:Int {
        var i = 0
        var temp:ListNode? = self
        while let _ = temp {
            temp = temp?.next
            i += 1
        }
        return i
    }
    
    func split(at index:Int) -> (ListNode, ListNode?) {
        guard index >= 1 else {
            return (self, nil)
        }
        let left = self
        var temp:ListNode? = self
        for _ in 1..<index {
            temp = temp?.next
            if temp == nil {
                break
            }
        }
        
        let right = temp?.next
        temp?.next = nil
        return (left, right)
    }
    
    func merge(_ left:ListNode?, _ right:ListNode?) -> ListNode{
        var current = self
        var left = left
        var right = right
        while let aLeft = left, let aRight = right {
            if aLeft.val > aRight.val {
                current.next = aRight
                current = aRight
                right = right?.next
            } else {
                current.next = aLeft
                current = aLeft
                left = left?.next
            }
        }
        current.next = left != nil ? left : right
        while let next = current.next {
            current = next
        }
        return current
    }
}

