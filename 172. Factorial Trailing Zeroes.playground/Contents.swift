import Cocoa

/*
 给定一个整数 n，返回 n! 结果尾数中零的数量。
 
 示例 1:
 
 输入: 3
 输出: 0
 解释: 3! = 6, 尾数中没有零。
 示例 2:
 
 输入: 5
 输出: 1
 解释: 5! = 120, 尾数中有 1 个零.
 说明: 你算法的时间复杂度应为 O(log n) 。
*/

let num = 200

class Solution {
    func trailingZeroes(_ n: Int) -> Int {
        guard n >= 5 else {
            return 0
        }
        
        var result = 0
        var five = 5
        
        while five <= n {
            result += n / five
            five *= 5
        }
        
        return result
    }
}

Solution().trailingZeroes(num)
