import Cocoa

let prices = [7,1,5,3,6,4]
class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else {
            return 0
        }
        var result = 0
        for index in 0..<prices.count - 1 {
            let dif = prices[index + 1] - prices[index]
            if dif > 0 {
                result += dif
            }
        }
        return result
    }
}

Solution().maxProfit(prices)
