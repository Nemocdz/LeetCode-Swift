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
        if nums.isEmpty {
            return [-1, -1]
        }
        
        func binarySearch(_ nums:[Int], target:Int, left:Bool) -> Int? {
            var start = 0
            var end = nums.count - 1
            while start <= end {
                let mid = (start + end) / 2
                if nums[mid] > target {
                    end = mid - 1
                } else if nums[mid] < target {
                    start = mid + 1
                } else {
                    if left {
                        end = mid - 1
                    } else {
                        start = mid + 1
                    }
                }
            }
            
            // 不越界去比较
            if left {
                return start <= nums.count - 1 && nums[start] == target ? start : nil
            } else {
                return end >= 0 && nums[end] == target ? end : nil
            }
        }
        
        if let left = binarySearch(nums, target: target, left: true),
            let right = binarySearch(nums, target: target, left: false) {
            return [left, right]
        }
        
        return [-1, -1]
    }
}

Solution().searchRange(a, 8)


