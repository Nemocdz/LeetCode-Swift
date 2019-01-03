import Cocoa

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


