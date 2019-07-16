import Cocoa

/*
 编写一个程序，找出第 n 个丑数。
 
 丑数就是只包含质因数 2, 3, 5 的正整数。
 
 示例:
 
 输入: n = 10
 输出: 12
 解释: 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 是前 10 个丑数。
 说明:
 
 1 是丑数。
 n 不超过1690。
*/

class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        guard n > 0 else {
            return -1
        }
        
        var uglyNumbers = [1]
        var i2 = 0
        var i3 = 0
        var i5 = 0
        
        while uglyNumbers.count < n {
            let v2 = uglyNumbers[i2] * 2
            let v3 = uglyNumbers[i3] * 3
            let v5 = uglyNumbers[i5] * 5
            let v = min(v2, v3, v5)
            if v == v2 {
                i2 += 1
            }
            if v == v3 {
                i3 += 1
            }
            if v == v5 {
                i5 += 1
            }
            uglyNumbers.append(v)
        }
        return uglyNumbers.last!
    }
}

Solution().nthUglyNumber(10)
