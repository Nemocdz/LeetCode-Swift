import Cocoa

/*
 给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。
 
 如果你最多只允许完成一笔交易（即买入和卖出一支股票），设计一个算法来计算你所能获取的最大利润。
 
 注意你不能在买入股票前卖出股票。
 
 示例 1:
 
 输入: [7,1,5,3,6,4]
 输出: 5
 解释: 在第 2 天（股票价格 = 1）的时候买入，在第 5 天（股票价格 = 6）的时候卖出，最大利润 = 6-1 = 5 。
 注意利润不能是 7-1 = 6, 因为卖出价格需要大于买入价格。
 示例 2:
 
 输入: [7,6,4,3,1]
 输出: 0
 解释: 在这种情况下, 没有交易完成, 所以最大利润为 0。
*/

let prices = [7,1,5,3,6,4]

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        // 第一位用于存储当前最小值
        var mins = [Int.max]
        for price in prices.dropLast() {
            let curMin = min(mins[0], price)
            mins[0] = curMin
            mins.append(curMin)
        }
        
        var answer = 0
        //从第二位起算
        for (price, min) in zip(prices, mins).dropFirst() {
            answer = max(answer, price - min)
        }
        return answer
    }
    
    func maxProfit2(_ prices: [Int]) -> Int {
        // 0 不持有，1 持有
        var dp_i_0 = 0
        var dp_i_1 = Int.min
        for i in 0..<prices.count {
            // dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + prices[i])
            dp_i_0 = max(dp_i_0, dp_i_1 + prices[i])
            // dp[i][1] = max(dp[i - 1][1], -prices[i])
            dp_i_1 = max(dp_i_1, -prices[i])
        }
        return dp_i_0
    }
}


Solution().maxProfit(prices)
