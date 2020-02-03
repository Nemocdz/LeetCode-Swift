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
        let nums = nums.sorted()
        var answers:[[Int]] = [[]]
        var last = 1
        for (index, num) in nums.enumerated() {
            let new = answers.enumerated()
                .filter {
                    !(index > 0 && num == nums[index - 1] && $0.0 < last)
                }
                .map {
                    $0.1 + [num]
                }
            last = answers.count
            answers.append(contentsOf: new)
        }
        return answers
    }
}

Solution().subsetsWithDup([1, 2, 2])
