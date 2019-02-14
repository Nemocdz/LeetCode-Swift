import Cocoa

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var i = 0
        for num in nums {
            if i < 2 || num > nums[i - 2] {
                nums[i] = num
                i += 1
            }
        }
        return i
    }
}
