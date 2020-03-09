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
        var temp = [Int]()
        
        func _permute(_ nums:[Int]) {
            if temp.count == nums.count {
                answers.append(temp)
            } else {
                for i in 0..<nums.count {
                    temp.append(nums[i])
                    _permute(Array(nums[0..<i]) + Array(nums[(i + 1)...]))
                    temp.removeLast()
                }
            }
        }
        
        _permute(nums)
        return answers
    }
}

