import Cocoa

/*
给定一个正整数 n，将其拆分为 至少两个正整数的和，并使这些整数的乘积最大化。 返回你可以获得的最大乘积。

示例 1:

输入: 2
输出: 1
解释: 2 = 1 + 1, 1 × 1 = 1。
示例 2:

输入: 10
输出: 36
解释: 10 = 3 + 3 + 4, 3 × 3 × 4 = 36。
说明: 你可以假设 n 不小于 2 且不大于 58。
*/

class Solution {
    func integerBreak(_ n: Int) -> Int {
        if n < 2 {
            return 0
        } else if n == 2 {
            return 1
        } else if n == 3 {
            return 2
        }
        
        var products = (0...n).map{ _ in 0 }
        products[1] = 1
        products[2] = 2
        products[3] = 3
        
        for i in 4...n {
            var temp = 0
            for j in 1...(i/2) {
                temp = max(temp, products[j] * products[i - j])
                products[i] = temp
            }
        }
        
        return products[n]
    }
}
