import Cocoa

/*
 Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.
 
 Example:
 
 Input: s = 7, nums = [2,3,1,2,4,3]
 Output: 2
 Explanation: the subarray [4,3] has the minimal length under the problem constraint.
 Follow up:
 If you have figured out the O(n) solution, try coding another solution of which the time complexity is O(n log n).
*/

class Solution {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        var sums = [Int](repeating: 0, count: nums.count + 1)
        for i in 1..<nums.count + 1 {
            sums[i] = sums[i - 1] + nums[i - 1]
        }
        var i = nums.count
        var length = Int.max
        while i >= 0 && sums[i] >= s {
            if let j = sums.firstIndex(where: { $0 > sums[i] - s}) {
                length = min(length, i - j + 1)
            }
            i -= 1
        }
        return length == Int.max ? 0 : length
    }
}
