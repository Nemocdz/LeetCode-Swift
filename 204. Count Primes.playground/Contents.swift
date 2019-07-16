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
        guard n > 1 else {
            return 0
        }
        var isPrimes = [Bool](repeating:true, count: n)
        isPrimes[0] = false
        isPrimes[1] = false
        
        for i in 2..<n where i * i < n{
            guard isPrimes[i] else {
                continue
            }
            
            var j = i * i
            while j < n {
                isPrimes[j] = false
                j += i
            }
        }
        
        return isPrimes.filter({(isPrimes) -> Bool in
            return isPrimes
        }).count
        
    }
}

Solution().countPrimes(10)
