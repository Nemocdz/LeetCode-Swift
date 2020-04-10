import Cocoa

/*
 给定一个无序的整数数组，找到其中最长上升子序列的长度。

 示例:

 输入: [10,9,2,5,3,7,101,18]
 输出: 4
 解释: 最长的上升子序列是 [2,3,7,101]，它的长度是 4。
 说明:

 可能会有多种最长上升子序列的组合，你只需要输出对应的长度即可。
 你算法的时间复杂度应该为 O (n2) 。
 进阶: 你能将算法的时间复杂度降低到 O (n log n) 吗？
 */

class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        
        if nums.count == 1 {
            return 1
        }
        
        var lengths = nums.map{ _ in 1 }
        for i in 1..<nums.count {
            var maxLength = 0
            // dp[i] = max(dp[0]...dp[i - 1]) + 1
            for j in 0..<i {
                if nums[j] < nums[i] {
                    maxLength = max(maxLength, lengths[j])
                }
            }
            lengths[i] = maxLength + 1
        }
        return lengths.max()!
    }
}
