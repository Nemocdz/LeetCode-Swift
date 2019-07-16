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
        guard !nums.isEmpty else {
            return []
        }
        var first = (0, 0)
        var second = (0, 1)
        for n in nums {
            if n == first.1 {
                first.0 += 1
            } else if n == second.1 {
                second.0 += 1
            } else if first.0 == 0 {
                first = (1, n)
            } else if second.0 == 0 {
                second = (1, n)
            } else {
                first.0 -= 1
                second.0 -= 1
            }
        }
        first.0 = 0
        second.0 = 0
        for n in nums {
            if n == first.1 {
                first.0 += 1
            } else if n == second.1 {
                second.0 += 1
            }
        }
        let result = [first, second].filter { $0.0 > nums.count / 3 }.map{ $0.1 }
        return result
    }
}
