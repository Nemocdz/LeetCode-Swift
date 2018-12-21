import Cocoa

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

