import Cocoa

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        var result = false
        var start = 0
        var end  = nums.count - 1
        while start <= end {
            let mid = (start + end) / 2
            if nums[mid] == target {
                result = true
                break
            }
            
            if nums[start] == nums[mid] && nums[end] == nums[mid] {
                start += 1
                end -= 1
            } else if nums[start] <= nums[mid] {
                if target >= nums[start] && target < nums[mid] {
                    end = mid - 1
                } else {
                    start = mid + 1
                }
            } else {
                if target > nums[mid] && target <= nums[end] {
                    start = mid + 1
                } else {
                    end = mid - 1
                }
            }
        }
        return result
    }
}
