import Cocoa

class Solution {
    func numTrees(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        var results = [Int]()
        return numTrees(n, &results)
    }

    func numTrees(_ n: Int, _ results: inout [Int]) -> Int {
        if n < results.count {
            return results[n]
        }
        if n == 0 {
            results.append(1)
            return 1
        }
        
        var result = 0
        for num in 0..<n {
            result += numTrees(num, &results) * numTrees(n - num - 1, &results)
        }
        
        results.append(result)
        return result
    }
}

Solution().numTrees(3)
