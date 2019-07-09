import Cocoa

/*
 给定一个包含 n 个整数的数组 nums 和一个目标值 target，判断 nums 中是否存在四个元素 a，b，c 和 d ，使得 a + b + c + d 的值与 target 相等？找出所有满足条件且不重复的四元组。
 
 注意：
 
 答案中不可以包含重复的四元组。
 
 示例：
 
 给定数组 nums = [1, 0, -1, 0, -2, 2]，和 target = 0。
 
 满足要求的四元组集合为：
 [
 [-1,  0, 0, 1],
 [-2, -1, 1, 2],
 [-2,  0, 0, 2]
 ]
*/

let a = [1, 0, -1, 0, -2, 2]

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count >= 4 else {
            return []
        }
        var nums = nums
        nums.sort()
        var result = [[Int]]()
        for (index, num) in nums.dropLast().dropLast().dropLast().enumerated() {
            guard index < 1 || num != nums[index - 1] else {
                continue
            }
            let otherNums = Array(nums[index..<nums.count].dropFirst())
            let others = threeSum(otherNums, target - num)
            others.forEach { (other) in
                var array = [num]
                array.append(contentsOf: other)
                result.append(array)
            }
        }
        return result
    }
    
    func threeSum(_ nums: [Int],_ target:Int) -> [[Int]] {
        guard nums.count >= 3 else {
            return []
        }
        var result = [[Int]]()
        for (index, num) in nums.dropLast().dropLast().enumerated() {
            guard index < 1 || num != nums[index - 1] else {
                continue
            }
            let otherNums = Array(nums[index..<nums.count].dropFirst())
            let others = twoSum(otherNums, target - num)
            
            others.forEach { (other) in
                var array = [num]
                array.append(contentsOf: other)
                result.append(array)
            }
        }
        return result
    }
    
    func twoSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count >= 2 else {
            return []
        }
        var start = 0
        var end = nums.count - 1
        var result = [[Int]]()
        while start < end {
            let a = nums[start]
            let b = nums[end]
            let sum = a + b
            if sum > target {
                end -= 1
            } else if sum < target {
                start += 1
            } else {
                result.append([a, b])
                start += 1
                end -= 1
                while start < end && nums[start] == nums[start - 1]{
                    start += 1
                }
                while start < end && nums[end] == nums[end + 1] {
                    end -= 1
                }
            }
        }
        return result
    }
}


Solution().fourSum(a, 0)
