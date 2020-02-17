import Cocoa

/*
 给定一个可包含重复数字的序列，返回所有不重复的全排列。

 示例:

 输入: [1,1,2]
 输出:
 [
   [1,1,2],
   [1,2,1],
   [2,1,1]
 ]
 */


class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var answers = [[Int]]()
        
        func _permute(_ nums: [Int], _ start: Int) {
            if start == nums.count - 1 {
                answers.append(nums)
            } else {
                var nums = nums
                for i in start..<nums.count {
                    if start == i || !nums[start..<i].contains(nums[i]) {
                        nums.swapAt(start, i)
                        _permute(nums, start + 1)
                        nums.swapAt(start, i)
                    }
                }
            }
        }
        
        _permute(nums, 0)
        return answers
    }
}
