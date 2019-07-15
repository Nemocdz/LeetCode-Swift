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
        guard !triangle.isEmpty else {
            return 0
        }
        
        var triangle = triangle
        
        for (i, _) in triangle.enumerated().dropFirst() {
            let pre = triangle[i - 1]
            var current = triangle[i]
            current[0] += pre[0]
            current[i] += pre[i - 1]
            for j in 1..<i {
                current[j] += min(pre[j], pre[j - 1])
            }
            triangle[i] = current
        }
        
        return triangle.last!.min()!
    }
}

Solution().minimumTotal(a)
