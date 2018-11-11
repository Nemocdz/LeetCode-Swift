import Cocoa

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
