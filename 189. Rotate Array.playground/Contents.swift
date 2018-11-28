import Cocoa

var nums = [1, 2, 3, 4, 5, 6, 7]
let k = 8

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        var k = k
        if k > nums.count{
            k = k % nums.count
        }
        nums.reverse(0, nums.count - 1 - k)
        nums.reverse(nums.count - k, nums.count - 1)
        nums.reverse()
    }
}

extension Array where Element == Int{
    mutating func reverse(_ start:Int ,_ end:Int) {
        var start = start
        var end = end
        while start < end {
            (self[start], self[end]) = (self[end], self[start])
            start += 1
            end -= 1
        }
    }
}

Solution().rotate(&nums, k)
