import Cocoa

/*
 给定一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？找出所有满足条件且不重复的三元组。
 
 注意：答案中不可以包含重复的三元组。
 
 例如, 给定数组 nums = [-1, 0, 1, 2, -1, -4]，
 
 满足要求的三元组集合为：
 [
 [-1, 0, 1],
 [-1, -1, 2]
 ]
*/

let a = [-1, 0, 1, 2, -1, -4]

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        return threeSum(nums, target: 0)
    }
    
    func threeSum(_ nums:[Int], target:Int) -> [[Int]] {
        if nums.count < 3 {
            return []
        }
        
        var anwsers = [[Int]]()
        let nums = nums.sorted()
        for (index, num) in nums.enumerated() {
            if (index > 0 && num == nums[index - 1]) || index + 2 >= nums.count {
                continue
            }
            anwsers.append(contentsOf: twoSum(Array(nums[(index + 1)...]), target: target - num).map{ [num] + $0 })
        }
        return anwsers
    }

    
    func twoSum(_ nums:[Int], target:Int) -> [[Int]] {
        if nums.count < 2 {
            return []
        }
        
        var anwsers = [[Int]]()
        let nums = nums.sorted()
        var start = 0
        var end = nums.count - 1
        
        while start < end {
            let first = nums[start]
            let second = nums[end]
            let sum = first + second
            if sum > target {
                end -= 1
            } else if sum < target {
                start += 1
            } else {
                anwsers.append([first, second])
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
        return anwsers
    }

}

Solution().threeSum(a)
