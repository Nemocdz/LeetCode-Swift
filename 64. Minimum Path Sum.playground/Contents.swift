import Cocoa

/*
 给定一个包含非负整数的 m x n 网格，请找出一条从左上角到右下角的路径，使得路径上的数字总和为最小。
 
 说明：每次只能向下或者向右移动一步。
 
 示例:
 
 输入:
 [
    [1,3,1],
    [1,5,1],
    [4,2,1]
 ]
 输出: 7
 解释: 因为路径 1→3→1→1→1 的总和最小。
*/

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        if grid.last?.last == nil {
            return 0
        }
        var paths = grid.map{ $0.map{_ in Int.max }}
        for (i, row) in grid.enumerated() {
            for (j, point) in row.enumerated() {
                if i == 0 && j == 0 {
                    paths[i][j] = point
                } else if i == 0 {
                    paths[i][j] = paths[i][j - 1] + point
                } else if j == 0 {
                    paths[i][j] = paths[i - 1][j] + point
                } else {
                    paths[i][j] = min(paths[i - 1][j], paths[i][j - 1]) + point
                }
            }
        }
        return paths.last!.last!
    }
}
