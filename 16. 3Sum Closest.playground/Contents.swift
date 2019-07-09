import Cocoa

/*
 给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。
 
 例如，给定数组 nums = [-1，2，1，-4], 和 target = 1.
 
 与 target 最接近的三个数的和为 2. (-1 + 2 + 1 = 2).
*/

let a = [0, 2, 1, -3]

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count >= 3 else {
            return 0
        }
        var nums = nums
        nums.sort()
        var result = nums[0] + nums[1] + nums[nums.count - 1]
        for index in 0..<nums.count - 1{
            var start = index + 1
            var end = nums.count - 1
            while start < end {
                let sum = nums[start] + nums[index] + nums[end]
                if sum < target {
                    start += 1
                } else if sum > target {
                    end -= 1
                } else {
                    result = sum
                    break
                }
                result = abs(sum - target) < abs(target - result) ? sum : result
            }
        }
        return result
    }
}

Solution().threeSumClosest(a, 1)

