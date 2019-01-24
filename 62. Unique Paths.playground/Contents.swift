import Cocoa

class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if m > n {
            return uniquePaths(n, m)
        }
        var lastTops = [Int](repeating: 1, count: m)
        var lastLeft = 1
        var result = 0
        for _ in 1..<n {
            for j in 1..<m {
                lastLeft = j == 1 ? 1 : result
                result = lastLeft + lastTops[j]
                lastTops[j] = result
            }
        }
        return result
    }
}

Solution().uniquePaths(3, 2)
