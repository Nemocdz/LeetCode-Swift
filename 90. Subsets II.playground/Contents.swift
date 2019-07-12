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
        var nums = nums
        nums.sort()
        var result = [[Int]]()
        result.append([])
        var size = 0
        for (i,num) in nums.enumerated() {
            let start = i > 0 && num == nums[i - 1] ? size : 0
            size = result.count
            for j in start..<result.count {
                var subSet = result[j]
                subSet.append(num)
                result.append(subSet)
            }
        }
        return result
    }
}
