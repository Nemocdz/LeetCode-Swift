import Cocoa

/*
 给定一个三角形，找出自顶向下的最小路径和。每一步只能移动到下一行中相邻的结点上。
 
 例如，给定三角形：
 
 [
 [2],
 [3,4],
 [6,5,7],
 [4,1,8,3]
 ]
 自顶向下的最小路径和为 11（即，2 + 3 + 5 + 1 = 11）。
 
 说明：
 
 如果你可以只使用 O(n) 的额外空间（n 为三角形的总行数）来解决这个问题，那么你的算法会很加分。
*/

let a = [[2],[3,4],[6,5,7],[4,1,8,3]]

class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        if triangle.first?.first == nil {
            return 0
        }
        
        var lastPaths = [Int](repeating: 0, count: triangle.count)
        
        // dp[i - 1][j - 1]
        var pre = 0
        // dp[i - 1][j]
        var current = 0
        
        for (i, row) in triangle.enumerated() {
            for j in 0...i {
                current = lastPaths[j]
                if j == 0 {
                    lastPaths[j] = current + row[j]
                } else if j == i {
                    lastPaths[j] = pre + row[j]
                } else {
                    lastPaths[j] = min(pre, current) + row[j]
                }
                pre = current
            }
        }
        
        return lastPaths.min()!
    }
}

Solution().minimumTotal(a)
