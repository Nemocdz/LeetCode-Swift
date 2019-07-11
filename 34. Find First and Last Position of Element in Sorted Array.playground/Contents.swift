import Cocoa

/*
 给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。
 
 你的算法时间复杂度必须是 O(log n) 级别。
 
 如果数组中不存在目标值，返回 [-1, -1]。
 
 示例 1:
 
 输入: nums = [5,7,7,8,8,10], target = 8
 输出: [3,4]
 示例 2:
 
 输入: nums = [5,7,7,8,8,10], target = 6
 输出: [-1,-1]
*/

let a = [5, 7, 7, 8, 8, 10]
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        guard !nums.isEmpty else {
            return [-1, -1]
        }
        let left = findIndex(nums, target, false)
        if left == nums.count || nums[left] != target  {
            return [-1, -1]
        }
        let right = findIndex(nums, target, true) - 1
        return [left, right]
    }
    
    func findIndex(_ nums:[Int], _ target:Int, _ isBigger:Bool) -> Int{
        var start = 0
        var end = nums.count
        while start < end {
            let mid = (start + end) / 2
            if nums[mid] > target || (!isBigger && nums[mid] == target) {
                end = mid
            } else {
                start = mid + 1
            }
        }
        return start
    }
}

Solution().searchRange(a, 8)


