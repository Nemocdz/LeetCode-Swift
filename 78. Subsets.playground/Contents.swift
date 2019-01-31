import Cocoa

class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        result.append([])
        for num in nums {
            for i in 0..<result.count {
                var subSet = result[i]
                subSet.append(num)
                result.append(subSet)
            }
        }
        return result
    }
}
