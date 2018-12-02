import Cocoa

let a = [1, 1, 2]

class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        return Set(nums).count < nums.count
    }
}

Solution().containsDuplicate(a)
