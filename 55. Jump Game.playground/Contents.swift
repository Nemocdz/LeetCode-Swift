import Cocoa


let a = [2, 3, 1, 1, 4]

class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var lastPosition = nums.count - 1
        for (index, num) in nums.enumerated().reversed() {
            if index + num >= lastPosition {
                lastPosition = index
            }
        }
        return lastPosition == 0
    }
}

Solution().canJump(a)
