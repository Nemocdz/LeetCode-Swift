import Cocoa

/*
 给定一个整数 n，生成所有由 1 ... n 为节点所组成的二叉搜索树。
 
 示例:
 
 输入: 3
 输出:
 [
     [1,null,3,2],
     [3,2,null,1],
     [3,1,null,null,2],
     [2,1,3],
     [1,null,2,null,3]
 ]
 解释:
 以上的输出对应以下 5 种不同结构的二叉搜索树：
 
   1         3     3      2      1
    \       /     /      / \      \
     3     2     1      1   3      2
    /     /       \                 \
   2     1         2                 3
 
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
    func generateTrees(_ n: Int) -> [TreeNode?] {
        if n == 0 {
            return []
        }
        
        func _generateTrees(_ nums: [Int]) -> [TreeNode?] {
            var answers = [TreeNode?]()
            for num in nums {
                for left in _generateTrees(nums.filter{ $0 < num }) {
                    for right in _generateTrees(nums.filter{ $0 > num }) {
                        let root = TreeNode(num)
                        root.left = left
                        root.right = right
                        answers.append(root)
                    }
                }
            }
            return answers.isEmpty ? [nil] : answers
        }
        
        return _generateTrees((1...n).map{ $0 })
    }
}

Solution().generateTrees(3)

