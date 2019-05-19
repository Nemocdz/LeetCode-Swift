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
        for i in 1..<sums.count {
            sums[i] = sums[i - 1] + nums[i - 1]
        }
        var i = nums.count
        var length = Int.max
        
        func binarySearch(_ left:Int, _ right:Int, _ nums:[Int], _ target:Int) -> Int? {
            var aLeft = left
            var aRight = right
            var middle = 0
            while aLeft <= aRight {
                middle = (aLeft + aRight) / 2
                if nums[middle] < target {
                    aLeft = middle + 1
                } else {
                    aRight = middle - 1
                }
            }
            return aLeft > right ? nil : aLeft
        }
        
        
        for i in 0..<sums.count {
            if let end = binarySearch(i + 1, sums.count - 1, sums, sums[i] + s) {
                length = min(length, end - i)
            } else {
                break
            }
        }
        return length == Int.max ? 0 : length
    }
}
