import Cocoa

/*
 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。
 
 示例:
 
 输入: [-2,1,-3,4,-1,2,1,-5,4],
 输出: 6
 解释: 连续子数组 [4,-1,2,1] 的和最大，为 6。
 进阶:
 
 如果你已经实现复杂度为 O(n) 的解法，尝试使用更为精妙的分治法求解。
*/

//let s = [8, -19, 5, -4, 20]
//let s = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
//let s = [1, 2]
//let s = [-1, -2]
let s = [-1, 0, -2]
class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        
        var temp = nums.first!
        var answer = temp
        
        for num in nums.dropFirst() {
            temp += num
            temp = max(num, temp)
            answer = max(temp, answer)
        }
        return answer
    }
}

Solution().maxSubArray(s)
