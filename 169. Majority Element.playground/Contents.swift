import Cocoa

let s = [3, 2, 3]

class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var balance = 1
        var result = nums.first!
        for num in nums.dropFirst() {
            if num == result {
                balance += 1
            } else {
                balance -= 1
                if balance == 0 {
                    result = num
                    balance = 1
                }
            }
        }
        return result
    }
}

Solution().majorityElement(s)
