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
        var answers = [Int](repeating: 0, count: n + 1)
        
        // dp(i) = 1 + min(dp(i - 1), dp(i - 4)...dp(i - k)), k * k <= n
        for i in 1...n {
            var minValue = Int.max
            var j = 1
            while j * j <= i {
                minValue = min(minValue, answers[i - j * j])
                j += 1
            }
            answers[i] = minValue + 1
        }
        
        return answers[n]
    }
}
