import Cocoa

/*
 Given a binary tree and a sum, find all root-to-leaf paths where each path's sum equals the given sum.
 
 Note: A leaf is a node with no children.
 
 Example:
 
 Given the below binary tree and sum = 22,
 
      5
     / \
    4   8
    /   / \
   11  13  4
  /  \    / \
 7    2  5   1
 Return:
 
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
        var result = [[Int]]()
        func pathSum(_ root: TreeNode?, _ sum: Int, _ array:[Int]){
            guard let root = root else { return }
            let remain = sum - root.val
            var array = array
            array.append(root.val)
            if remain == 0 && root.left == nil && root.right == nil {
                result.append(array)
                return
            } else {
                pathSum(root.left, remain, array)
                pathSum(root.right, remain, array)
            }
        }
        pathSum(root, sum, [])
        return result
    }
}
