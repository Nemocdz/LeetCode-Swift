import Cocoa

let prices = [7,1,5,3,6,4]

class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else {
            return 0
        }
        var buy = prices.first!
        var result = 0
        for index in 1..<prices.count {
            result = max(result, prices[index] - buy)
            buy = min(buy, prices[index])
        }
        return result
    }
}


Solution().maxProfit(prices)
