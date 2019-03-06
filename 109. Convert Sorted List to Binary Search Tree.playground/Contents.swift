import Cocoa

/*
 Given a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.
 
 For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
 
 Example:
 
 Given the sorted linked list: [-10,-3,0,5,9],
 
 One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:
 
      0
     / \
   -3   9
   /   /
 -10  5
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

/**
 * Definition for a binary tree node.
 */
 public class TreeNode {
      public var val: Int
      public var left: TreeNode?
      public var right: TreeNode?
      public init(_ val: Int) {
          self.val = val
          self.left = nil
          self.right = nil
      }
 }

class Solution {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        var array = [Int]()
        var temp = head
        while temp != nil {
            array.append(temp!.val)
            temp = temp?.next
        }
        func buildBST(_ array:[Int]) -> TreeNode?{
            guard !array.isEmpty else {
                return nil
            }
            let rootIndex = array.count / 2
            let left = Array(array[0..<rootIndex])
            let right = Array(array[rootIndex + 1..<array.count])
            let root = TreeNode(array[rootIndex])
            root.left = buildBST(left)
            root.right = buildBST(right)
            return root
        }
        return buildBST(array)
    }
}
