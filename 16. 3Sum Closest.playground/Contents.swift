import Cocoa

/*
 给定一个包括 n 个整数的数组 nums 和 一个目标值 target。找出 nums 中的三个整数，使得它们的和与 target 最接近。返回这三个数的和。假定每组输入只存在唯一答案。
 
 例如，给定数组 nums = [-1，2，1，-4], 和 target = 1.
 
 与 target 最接近的三个数的和为 2. (-1 + 2 + 1 = 2).
*/

let a = [-1, 2, 1, -4]

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        if nums.count < 3 {
            return 0
        }
        
        let nums = nums.sorted()
        var answer = nums[0] + nums[1] + nums[2]
        
        for (index, num) in nums.enumerated() {
            if (index > 0 && num == nums[index - 1] || index + 2 >= nums.count) {
                continue
            }
            
            var start = index + 1
            var end = nums.count - 1
            
            while start < end {
                let sum = num + nums[start] + nums[end]
                if sum > target {
                    end -= 1
                } else if sum < target {
                    start += 1
                } else {
                    answer = sum
                    break
                }
                if abs(sum - target) < abs(answer - target) {
                    answer = sum
                }
            }
        }
        
        return answer
    }
}

Solution().threeSumClosest(a, 1)

