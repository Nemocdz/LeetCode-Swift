import Cocoa

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

