import Cocoa

/*
 Given an array nums of n integers where n > 1,  return an array output such that output[i] is equal to the product of all the elements of nums except nums[i].
 
 Example:
 
 Input:  [1,2,3,4]
 Output: [24,12,8,6]
*/

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var result = nums.map{ _  in 1 }
        for i in 1..<nums.count {
            result[i] = result[i - 1] * nums[i - 1]
        }
        var temp = 1
        for i in (0..<nums.count).reversed() {
            result[i] = temp * result[i]
            temp = temp * nums[i]
        }
        
        return result
    }
}

Solution().productExceptSelf([1, 2, 3, 4])
