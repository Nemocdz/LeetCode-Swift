import Cocoa

/*
 给定一个二叉树，返回其节点值自底向上的层次遍历。 （即按从叶子节点所在层到根节点所在的层，逐层从左向右遍历）
 
 例如：
 给定二叉树 [3,9,20,null,null,15,7],
 
   3
  / \
 9  20
   /  \
  15   7
 返回其自底向上的层次遍历为：
 
 [
 [15,7],
 [9,20],
 [3]
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

let root = TreeNode(3)
root.left = TreeNode(9)
root.right = TreeNode(20)
root.right?.left = TreeNode(15)
root.right?.right = TreeNode(7)

class Solution {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        var dic = [Int:[Int]]()
        var result = [[Int]]()
        addValToDic(root, dic: &dic, currentHeight: 0)
        
        if dic.count == 1{
            result.append([root!.val])
        } else if dic.count > 1 {
            for index in 0...dic.count - 1{
                result.append(dic[dic.count - 1 - index]!)
            }
        }
        return result
    }
    
    func addValToDic(_ root:TreeNode?, dic:inout [Int:[Int]], currentHeight: Int) {
        guard let root = root else {
            return
        }
        
        if dic[currentHeight] == nil {
            dic[currentHeight] = [Int]()
        }
        
        dic[currentHeight]!.append(root.val)
        
        addValToDic(root.left, dic: &dic, currentHeight: currentHeight + 1)
        addValToDic(root.right, dic: &dic, currentHeight: currentHeight + 1)
    }
}

Solution().levelOrderBottom(root)
