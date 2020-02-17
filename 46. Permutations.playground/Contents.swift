import Cocoa

/*
给定一个没有重复数字的序列，返回其所有可能的全排列。

示例:

输入: [1,2,3]
输出:
[
  [1,2,3],
  [1,3,2],
  [2,1,3],
  [2,3,1],
  [3,1,2],
  [3,2,1]
]
*/

class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var answers = [[Int]]()
        
        func _permute(_ nums: [Int], _ start:Int) {
            if start == nums.count - 1 {
                answers.append(nums)
            } else {
                var nums = nums
                for i in start..<nums.count {
                    nums.swapAt(start, i)
                    _permute(nums, start + 1)
                    nums.swapAt(start, i)
                }
            }
        }
        
        _permute(nums, 0)
        return answers
    }
}

