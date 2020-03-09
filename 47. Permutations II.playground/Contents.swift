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
        var temp = [Int]()
                
        func _permute(_ nums:[Int]) {
            if nums.isEmpty {
                answers.append(temp)
            } else {
                for i in 0..<nums.count {
                    if i > 0 && nums[i] == nums[i - 1] {
                        continue
                    }
                    temp.append(nums[i])
                    _permute(Array(nums[0..<i]) + Array(nums[(i + 1)...]))
                    temp.removeLast()
                }
            }
        }

        _permute(nums.sorted())
        return answers
    }
}
