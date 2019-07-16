import Cocoa

/*
 给定一个二叉搜索树，编写一个函数 kthSmallest 来查找其中第 k 个最小的元素。
 
 说明：
 你可以假设 k 总是有效的，1 ≤ k ≤ 二叉搜索树元素个数。
 
 示例 1:
 
 输入: root = [3,1,4,null,2], k = 1
   3
  / \
 1   4
  \
   2
 输出: 1
 示例 2:
 
 输入: root = [5,3,6,2,4,null,null,1], k = 3
       5
      / \
     3   6
    / \
   2   4
  /
 1
 输出: 3
 进阶：
 如果二叉搜索树经常被修改（插入/删除操作）并且你需要频繁地查找第 k 小的值，你将如何优化 kthSmallest 函数？
 */

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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        func count(of root:TreeNode?) -> Int {
            guard let root = root else {
                return 0
            }
            return 1 + count(of: root.left) + count(of: root.right)
        }
        
        guard let root = root else {
            return -1
        }
        
        let leftCount = count(of: root.left)
        if k <= leftCount {
            return kthSmallest(root.left, k)
        } else if k > leftCount + 1 {
            return kthSmallest(root.right, k - 1 - leftCount)
        } else {
            return root.val
        }
    }
}
