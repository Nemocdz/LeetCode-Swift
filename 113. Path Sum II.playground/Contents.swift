import Cocoa

/*
 给定一个二叉树和一个目标和，找到所有从根节点到叶子节点路径总和等于给定目标和的路径。
 
 说明: 叶子节点是指没有子节点的节点。
 
 示例:
 给定如下二叉树，以及目标和 sum = 22，
 
       5
      / \
     4   8
    /   / \
   11  13  4
  /  \    / \
 7    2  5   1
 返回:
 
 [
 [5,4,11,2],
 [5,8,4,5]
 ]
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
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        var answers = [[Int]]()
        var temp = [Int]()
        
        func findPath(_ root: TreeNode, _ sum: Int) {
            let remain = sum - root.val
            temp.append(root.val)
            
            if remain == 0 && root.left == nil && root.right == nil {
                answers.append(temp)
            }
            
            if let left = root.left {
                findPath(left, remain)
            }
            
            if let right = root.right {
                findPath(right, remain)
            }
            
            temp.removeLast()
        }
        
        if let root = root {
            findPath(root, sum)
        }
        
        return answers
    }
}
