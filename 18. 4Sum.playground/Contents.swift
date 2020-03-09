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
        return kSum(nums, target: target, k: 4)
    }
    
    func kSum(_ nums:[Int], target:Int, k:Int) -> [[Int]] {
        if nums.count < k || k == 0 {
            return []
        }
        
        var answers = [[Int]]()
        var temp = [Int]()
        
        func _kSum(_ nums:[Int], target:Int, k:Int) {
            if k == 1 {
                if nums.contains(target) {
                    answers.append([target])
                }
            } else {
                for i in 0..<nums.count {
                    if (i > 0 && nums[i] == nums[i - 1]) || i + k - 1 >= nums.count {
                        continue
                    }
                    temp.append(nums[i])
                    _kSum(Array(nums[(i + 1)...]), target: target - nums[i], k: k - 1)
                    temp.removeLast()
                }
            }
        }

        _kSum(nums.sorted(), target: target, k: k)
        return answers
    }
}

Solution().fourSum(a, 0)
