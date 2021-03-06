import Cocoa

/*
 给定一组不含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。
 
 说明：解集不能包含重复的子集。
 
 示例:
 
 输入: nums = [1,2,3]
 输出:
 [
 [3],
     [1],
     [2],
     [1,2,3],
     [1,3],
     [2,3],
     [1,2],
     []
 ]
*/

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var answers = [[Int]]()
        var temp = [Int]()
        
        func _subset(_ nums:[Int]) {
            answers.append(temp)
            for i in 0..<nums.count {
                temp.append(nums[i])
                _subset(Array(nums[(i + 1)...]))
                temp.removeLast()
            }
        }
        return answers
    }
}
