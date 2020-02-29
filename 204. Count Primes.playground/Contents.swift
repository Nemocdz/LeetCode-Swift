import Cocoa

/*
 统计所有小于非负整数 n 的质数的数量。
 
 示例:
 
 输入: 10
 输出: 4
 解释: 小于 10 的质数一共有 4 个, 它们是 2, 3, 5, 7 。
*/

class Solution {
    func countPrimes(_ n: Int) -> Int {
        if n <= 2 {
            return 0
        }
        
        var primes = [Bool](repeating: true, count: n)
        
        // 填色法
        var i = 2
        while i * i < n {
            if primes[i] {
                // i 之前都被之前反过来排除过
                var j = i * i
                while j < n  {
                    primes[j] = false
                    j += i
                }
            }
            i += 1
        }
        
        return primes[2...].filter{ $0 }.count
    }
}

Solution().countPrimes(10)
