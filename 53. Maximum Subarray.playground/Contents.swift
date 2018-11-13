import Cocoa

let s = [8, -19, 5, -4, 20]
//let s = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
//let s = [1, 2]
//let s = [-1, -2]
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var sum = nums.first!
        var result = sum
        for num in nums.dropFirst(){
            sum += num
            if num > sum {
                sum = num
            }
            if sum > result {
                result = sum
            }
        }
        return result
    }
}

Solution().maxSubArray(s)
