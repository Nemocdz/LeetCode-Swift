import Cocoa

/*
 将一个按照升序排列的有序数组，转换为一棵高度平衡二叉搜索树。
 
 本题中，一个高度平衡二叉树是指一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1。
 
 示例:
 
 给定有序数组: [-10,-3,0,5,9],
 
 一个可能的答案是：[0,-3,9,-10,null,5]，它可以表示下面这个高度平衡二叉搜索树：
 
      0
     / \
   -3   9
   /   /
 -10  5
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

let a = [ -10, -3, 0, 5, 9]

class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard !nums.isEmpty else {
            return nil
        }
        
        let mid = nums.count / 2
        let result = TreeNode(nums[mid])
        result.left = sortedArrayToBST(Array(nums[0..<mid]))
        result.right = sortedArrayToBST(Array(nums[mid + 1..<nums.count]))
        return result
    }
}

Solution().sortedArrayToBST(a)

