import Cocoa

/*
 给定一个整数，编写一个函数来判断它是否是 2 的幂次方。
 
 示例 1:
 
 输入: 1
 输出: true
 解释: 20 = 1
 示例 2:
 
 输入: 16
 输出: true
 解释: 24 = 16
 示例 3:
 
 输入: 218
 输出: false
*/

let s = 218
class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n <= 0 {
            return false
        }
        
        var n = n
        
        while n > 1 {
            if n % 2 != 0 {
                return false
            }
            n /= 2
        }
        return true
    }
}

Solution().isPowerOfTwo(s)
