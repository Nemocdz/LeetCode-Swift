import Cocoa

let a = [4, 5, 6, 7, 0, 1, 2]

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var result = -1
        var start = 0
        var end  = nums.count - 1
        while start <= end {
            let mid = (start + end) / 2
            if nums[mid] == target {
                result = mid
                break
            }
            
            if nums[start] <= nums[mid] {
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

Solution().search(a, 0)
