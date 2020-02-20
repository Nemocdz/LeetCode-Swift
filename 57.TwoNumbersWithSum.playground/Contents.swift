import Cocoa

// 面试题 57（一）：和为 s 的两个数字
// 题目：输入一个递增排序的数组和一个数字 s，在数组中查找两个数，使得它们
// 的和正好是 s。如果有多对数字的和等于 s，输出任意一对即可。

// 面试题 57（二）：为 s 的连续正数序列
// 题目：输入一个正数 s，打印出所有和为 s 的连续正数序列（至少含有两个数）。
// 例如输入 15，由于 1+2+3+4+5=4+5+6=7+8=15，所以结果打印出 3 个连续序列 1～5、
// 4～6 和 7～8。

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var start = 0
        var end = nums.count - 1
        
        while start < end {
            let sum = nums[start] + nums[end]
            
            if sum > target {
                end -= 1
            } else if sum < target {
                start += 1
            } else {
                return [nums[start], nums[end]]
            }
        }
        
        return []
    }
    
    func findContinuousSequence(_ target: Int) -> [[Int]] {
        if target < 3 {
            return []
        }
        

        var start = 1
        var end = 2
        var curSum = start + end
        var answers = [[Int]]()
        
        // 起码两个数，所以前面一个数不能大于一半，且只能是奇数
        let half = (target + 1) / 2
        
        while start < half {
            // 如果大了就去掉前面一部分
            while curSum > target && start < half {
                curSum -= start
                start += 1
            }
            
            if curSum == target {
                 answers.append((start...end).map{ $0 })
            }
            
            // 往后延伸
            end += 1
            curSum += end
        }
        
        return answers
    }
}

Solution().findContinuousSequence(9)
