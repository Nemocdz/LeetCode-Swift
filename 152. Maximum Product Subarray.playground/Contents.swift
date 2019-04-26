import Cocoa

/*
Given an integer array nums, find the contiguous subarray within an array (containing at least one number) which has the largest product.

Example 1:

Input: [2,3,-2,4]
Output: 6
Explanation: [2,3] has the largest product 6.
Example 2:

Input: [-2,0,-1]
Output: 0
Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
*/


class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.first!
        }
        var a = nums
        for i in 1..<nums.count {
            a[i] *= a[i - 1] != 0 ? a[i - 1] : 1
        }
        var b = [Int](nums.reversed())
        for i in 1..<nums.count {
            b[i] *= b[i - 1] != 0 ? b[i - 1] : 1
        }
        
        return max(a.max()!, b.max()!)
    }
}
