import Cocoa

let nums = [1, 3, 5, 6]
let target = 7

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var result = nums.count
        for (index, num) in nums.enumerated(){
            if num >= target {
                result = index
                break
            }
        }
        return result
    }
}

Solution().searchInsert(nums, target)
