import Cocoa

/*
 给定一个单链表，其中的元素按升序排序，将其转换为高度平衡的二叉搜索树。
 
 本题中，一个高度平衡二叉树是指一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1。
 
 示例:
 
 给定的有序链表： [-10, -3, 0, 5, 9],
 
 一个可能的答案是：[0, -3, 9, -10, null, 5], 它可以表示下面这个高度平衡二叉搜索树：
 
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
