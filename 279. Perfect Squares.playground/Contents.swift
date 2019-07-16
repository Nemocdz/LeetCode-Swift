import Cocoa

/*
 给定正整数 n，找到若干个完全平方数（比如 1, 4, 9, 16, ...）使得它们的和等于 n。你需要让组成和的完全平方数的个数最少。
 
 示例 1:
 
 输入: n = 12
 输出: 3
 解释: 12 = 4 + 4 + 4.
 示例 2:
 
 输入: n = 13
 输出: 2
 解释: 13 = 4 + 9.
*/

class Solution {
    func numSquares(_ n: Int) -> Int {
        var records = (0..<n+1).map{ $0 }
        for i in 1..<n + 1 {
            var j = 1
            while j * j <= i {
                records[i] = min(records[i - j * j] + 1, records[i])
                j += 1
            }
        }
        return records.last!
    }
}
