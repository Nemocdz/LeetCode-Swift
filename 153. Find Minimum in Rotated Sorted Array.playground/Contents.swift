import Cocoa

/*
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.
 
 (i.e.,  [0,1,2,4,5,6,7] might become  [4,5,6,7,0,1,2]).
 
 Find the minimum element.
 
 You may assume no duplicate exists in the array.
 
 Example 1:
 
 Input: [3,4,5,1,2]
 Output: 1
 Example 2:
 
 Input: [4,5,6,7,0,1,2]
 Output: 0
*/

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        if nums.count <= 1 {
            return nums.first!
        }
        let midIndex = nums.count / 2
        let mid = nums[midIndex]
        if mid < nums.last! {
            return findMin(Array(nums[0..<midIndex + 1]))
        } else if mid > nums.last! {
            return findMin(Array(nums[midIndex + 1..<nums.count]))
        } else {
            return nums.first! < nums.last! ? nums.first! : nums.last!
        }
    }
}

Solution().findMin([3,4,5,1,2])
