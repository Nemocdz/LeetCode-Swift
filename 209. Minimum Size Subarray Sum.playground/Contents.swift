import Cocoa

/*
 给定一个含有 n 个正整数的数组和一个正整数 s ，找出该数组中满足其和 ≥ s 的长度最小的连续子数组。如果不存在符合条件的连续子数组，返回 0。
 
 示例:
 
 输入: s = 7, nums = [2,3,1,2,4,3]
 输出: 2
 解释: 子数组 [4,3] 是该条件下的长度最小的连续子数组。
 进阶:
 
 如果你已经完成了O(n) 时间复杂度的解法, 请尝试 O(n log n) 时间复杂度的解法。
*/

class Solution {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        var answer = nums.count + 1
        var sum = 0
        var start = 0
        
        for (index, num) in nums.enumerated() {
            sum += num
            // start 已经为 i - 1 时尽可能满足的最小长度
            while sum >= s  {
                answer = min(answer, index - start + 1)
                sum -= nums[start]
                start += 1
            }
        }
        
        return answer > nums.count ? 0 : answer
    }
}
