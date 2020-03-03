import Cocoa

/*
 给定一个大小为 n 的数组，找出其中所有出现超过 ⌊ n/3 ⌋ 次的元素。
 
 说明: 要求算法的时间复杂度为 O(n)，空间复杂度为 O(1)。
 
 示例 1:
 
 输入: [3,2,3]
 输出: [3]
 示例 2:
 
 输入: [1,1,1,3,3,2,2,2]
 输出: [1,2]
*/

class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        if nums.isEmpty {
            return []
        }
        
        var answer1 = nums.first!
        var times1 = 0
        var answer2 = nums.first!
        var times2 = 0
        
        for num in nums {
            if num == answer1 {
                times1 += 1
            } else if num == answer2 {
                times2 += 1
            } else if times1 == 0 {
                answer1 = num
                times1 = 1
            } else if times2 == 0 {
                answer2 = num
                times2 = 1
            } else {
                times1 -= 1
                times2 -= 2
            }
        }
        
        times1 = 0
        times2 = 0
        for num in nums {
            times1 += num == answer1 ? 1 : 0
            times2 += num == answer2 ? 1 : 0
        }
        
        var answers = [Int]()
        if times1 >= nums.count / 3 {
            answers.append(answer1)
        }
        
        if answer1 != answer2 && times2 >= nums.count / 3 {
            answers.append(answer2)
        }
        return answers
    }
}
