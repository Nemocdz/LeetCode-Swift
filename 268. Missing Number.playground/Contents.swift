import Cocoa

let s = [1, 2 ,3, 0, 5]

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let max = nums.count
        let sum = nums.reduce(0, {$0 + $1})
        return (1 + max) * max / 2 - sum
    }
}

Solution().missingNumber(s)
