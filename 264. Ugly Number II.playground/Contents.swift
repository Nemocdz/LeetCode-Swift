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
        var uglyNums = [1]
        
        var index2 = 0
        var index3 = 0
        var index5 = 0
        
        for _ in 1...n {
            let next = min(uglyNums[index2] * 2, uglyNums[index3] * 3, uglyNums[index5] * 5)
            uglyNums.append(next)
            while uglyNums[index2] * 2 <= next {
                index2 += 1
            }
            
            while uglyNums[index3] * 3 <= next {
                index3 += 1
            }
            
            while uglyNums[index5] * 5 <= next {
                index5 += 1
            }
        }
        return uglyNums[n - 1]
    }
}

Solution().nthUglyNumber(10)
