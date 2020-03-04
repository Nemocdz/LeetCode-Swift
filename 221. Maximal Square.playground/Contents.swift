import Cocoa

/*
 在一个由 0 和 1 组成的二维矩阵内，找到只包含 1 的最大正方形，并返回其面积。

 示例:

 输入:

 1 0 1 0 0
 1 0 1 1 1
 1 1 1 1 1
 1 0 0 1 0

 输出: 4
 */

class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        var widths = matrix.map{ $0.map{_ in 0 } }
        var maxWidth = 0
        for (i, row) in matrix.enumerated() {
            for (j, num) in row.enumerated() {
                if (i == 0 || j == 0) && num == "1"  {
                    widths[i][j] = 1
                } else {
                    if num == "1" {
                        // 只由左，左上，上影响
                        widths[i][j] = min(widths[i - 1][j], widths[i - 1][j - 1], widths[i][j - 1]) + 1
                    }
                }

                maxWidth = max(maxWidth, widths[i][j])
            }
        }
        
        return maxWidth * maxWidth
    }
}
