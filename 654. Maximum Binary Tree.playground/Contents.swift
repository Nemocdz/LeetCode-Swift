import Cocoa

/*
 给定一个不含重复元素的整数数组。一个以此数组构建的最大二叉树定义如下：
 
 二叉树的根是数组中的最大元素。
 左子树是通过数组中最大值左边部分构造出的最大二叉树。
 右子树是通过数组中最大值右边部分构造出的最大二叉树。
 通过给定的数组构建最大二叉树，并且输出这个树的根节点。
 
 Example 1:
 
 输入: [3,2,1,6,0,5]
 输入: 返回下面这棵树的根节点：
 
    6
  /   \
 3     5
  \    /
   2  0
    \
     1
 注意:
 
 给定的数组的大小在 [1, 1000] 之间。
*/

let s = [3,2,1,6,0,5]

/**
Definition for a binary tree node.
 **/

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
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        if nums.count == 0 {
            return nil
        }
        let (max, index) = findMax(nums)
        let root = TreeNode(max)
        root.left = constructMaximumBinaryTree(Array(nums[0..<index]))
        root.right = constructMaximumBinaryTree(Array(nums[(index + 1)..<nums.count]))
        return root
    }
    
    
    func findMax(_ nums:[Int]) -> (Int, Int){
        var max = nums[0]
        var index = 0
        for i in 0..<nums.count{
            if nums[i] > max{
                max = nums[i]
                index = i
            }
        }
        return (max, index)
    }
}

Solution().constructMaximumBinaryTree(s)
