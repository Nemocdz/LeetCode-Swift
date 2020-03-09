import Cocoa

/*
 给定一个可能包含重复元素的整数数组 nums，返回该数组所有可能的子集（幂集）。
 
 说明：解集不能包含重复的子集。
 
 示例:
 
 输入: [1,2,2]
 输出:
 [
 [2],
 [1],
 [1,2,2],
 [2,2],
 [1,2],
 []
 ]
*/

class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var answers = [[Int]]()
        var temp = [Int]()
        
        func _subsets(_ nums:[Int]) {
            answers.append(temp)
            for i in 0..<nums.count {
                if i > 0 && nums[i] == nums[i - 1] {
                    continue
                }
                temp.append(nums[i])
                _subsets(Array(nums[(i + 1)...]))
                temp.removeLast()
            }
        }
        
        _subsets(nums.sorted())
        return answers
    }
}

Solution().subsetsWithDup([1, 2, 2])
