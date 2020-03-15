import Cocoa

/*
 假设按照升序排序的数组在预先未知的某个点上进行了旋转。

 ( 例如，数组 [0,1,2,4,5,6,7] 可能变为 [4,5,6,7,0,1,2] )。

 请找出其中最小的元素。

 注意数组中可能存在重复的元素。

 示例 1：

 输入: [1,3,5]
 输出: 1
 示例 2：

 输入: [2,2,2,0,1]
 输出: 0
 说明：

 这道题是 寻找旋转排序数组中的最小值 的延伸题目。
 允许重复会影响算法的时间复杂度吗？会如何影响，为什么？
 */

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var start = 0
        var end = nums.count - 1
        
        while start < end {
            let mid = (start + end) / 2
            
            if nums[mid] < nums[end] {
                end = mid
            } else if nums[mid] > nums[end] {
                start = mid + 1
            } else {
                // nums[start] == nums[mid] == nums[end] end 在 start 后面，所以 end 不可能
                if nums[start] == nums[mid] {
                    end -= 1
                } else {
                    end = mid
                }
            }
        }
        
        return nums[start]
    }
}
