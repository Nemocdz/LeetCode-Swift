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
        var sums = [Int](repeating: 0, count: nums.count + 1)
        for i in 1..<sums.count {
            sums[i] = sums[i - 1] + nums[i - 1]
        }
        var i = nums.count
        var length = Int.max
        
        func binarySearch(_ left:Int, _ right:Int, _ nums:[Int], _ target:Int) -> Int? {
            var aLeft = left
            var aRight = right
            var middle = 0
            while aLeft <= aRight {
                middle = (aLeft + aRight) / 2
                if nums[middle] < target {
                    aLeft = middle + 1
                } else {
                    aRight = middle - 1
                }
            }
            return aLeft > right ? nil : aLeft
        }
        
        
        for i in 0..<sums.count {
            if let end = binarySearch(i + 1, sums.count - 1, sums, sums[i] + s) {
                length = min(length, end - i)
            } else {
                break
            }
        }
        return length == Int.max ? 0 : length
    }
}
