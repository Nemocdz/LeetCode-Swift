import Cocoa

/*
 给定一个二维矩阵，计算其子矩形范围内元素的总和，该子矩阵的左上角为 (row1, col1) ，右下角为 (row2, col2)。


 上图子矩阵左上角 (row1, col1) = (2, 1) ，右下角 (row2, col2) = (4, 3)，该子矩形内元素的总和为 8。

 示例:

 给定 matrix = [
   [3, 0, 1, 4, 2],
   [5, 6, 3, 2, 1],
   [1, 2, 0, 1, 5],
   [4, 1, 0, 1, 7],
   [1, 0, 3, 0, 5]
 ]

 sumRegion(2, 1, 4, 3) -> 8
 sumRegion(1, 1, 2, 2) -> 11
 sumRegion(1, 2, 2, 4) -> 12
 说明:

 你可以假设矩阵不可变。
 会多次调用 sumRegion 方法。
 你可以假设 row1 ≤ row2 且 col1 ≤ col2。
 */

class NumMatrix {
    var sums:[[Int]]
    init(_ matrix: [[Int]]) {
        sums = matrix
        let height = matrix.count
        let width = matrix.first?.count ?? 0
        for i in 0..<height {
            for j in 0..<width {
                if i > 0 && j > 0 {
                    sums[i][j] = sums[i][j] + sums[i - 1][j] + sums[i][j - 1] - sums[i - 1][j - 1]
                } else if i > 0 {
                    sums[i][j] = sums[i][j] + sums[i - 1][j]
                } else if j > 0 {
                    sums[i][j] = sums[i][j] + sums[i][j - 1]
                }
            }
        }
    }
    
    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        let top = col1 > 0 ? sums[row2][col1 - 1] : 0
        let left = row1 > 0 ? sums[row1 - 1][col2] : 0
        let topLeft = col1 > 0 && row1 > 0 ? sums[row1 - 1][col1 - 1] : 0
        return sums[row2][col2] - top - left + topLeft
    }
}
