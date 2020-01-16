import Cocoa

/*
 给定一个排序数组和一个目标值，在数组中找到目标值，并返回其索引。如果目标值不存在于数组中，返回它将会被按顺序插入的位置。
 
 你可以假设数组中无重复元素。
 
 示例 1:
 
 输入: [1,3,5,6], 5
 输出: 2
 示例 2:
 
 输入: [1,3,5,6], 2
 输出: 1
 示例 3:
 
 输入: [1,3,5,6], 7
 输出: 4
 示例 4:
 
 输入: [1,3,5,6], 0
 输出: 0
*/

let nums = [1, 3, 5, 6]
let target = 0

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count - 1
        while start <= end {
            let mid = (start + end) / 2
            if nums[mid] > target {
                end -= 1
            } else if nums[mid] < target {
                start += 1
            } else {
                return mid
            }
        }
        return start
    }
}

Solution().searchInsert(nums, target)
