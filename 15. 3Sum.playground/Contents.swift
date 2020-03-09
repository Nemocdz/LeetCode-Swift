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
        
        for i in 0..<nums.count {
            if (i > 0 && nums[i] == nums[i - 1]) || i + 2 >= nums.count {
                continue
            }
            
            let new = twoSum(Array(nums[i + 1]...), target: target - nums[i]).map{ $0 + [nums[i]] }
            anwsers.append(contentsOf: new)
        }
        
        return anwsers
    }
    
    func twoSum(_ nums:[Int], target:Int) -> [[Int]] {
        if nums.count < 2 {
            return []
        }
        
        var answers = [[Int]]()
        let nums = nums.sorted()
        var start = 0
        var end = nums.count - 1
        
        while start < end {
            if nums[start] + nums[end] > target {
                end -= 1
            } else if nums[start] + nums[end] < target {
                start += 1
            } else {
                answers.append([nums[start], nums[end]])
                start += 1
                end -= 1
            }
        }
        
        return answers
    }
}

Solution().threeSum(a)
