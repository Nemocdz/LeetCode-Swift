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
 
class Solution {
    func generateTrees(_ n: Int) -> [TreeNode?] {
        if n == 0 {
            return []
        }
        let nums = (1..<n + 1).map{$0}
        return generateTrees(nums)
    }
    
    func generateTrees(_ nums: [Int]) -> [TreeNode?] {
        var result = [TreeNode]()
        for i in nums {
            let (small, big) = nums.split(i)
            let smalls = generateTrees(small)
            let bigs = generateTrees(big)
            for s in smalls {
                for b in bigs {
                    let root = TreeNode(i)
                    root.left = s
                    root.right = b
                    result.append(root)
                }
            }
        }
        return result.isEmpty ? [nil] : result
    }
}

extension Array where Element == Int{
    func split(_ x:Int) -> ([Int], [Int]) {
        var small = [Int]()
        var big = [Int]()
        for num in self {
            if num > x {
                big.append(num)
            } else if num < x {
                small.append(num)
            }
        }
        return (small, big)
    }
}

Solution().generateTrees(3)

