import Cocoa

/*
 给定一个二维的矩阵，包含 'X' 和 'O'（字母 O）。

 找到所有被 'X' 围绕的区域，并将这些区域里所有的 'O' 用 'X' 填充。

 示例:

 X X X X
 X O O X
 X X O X
 X O X X
 运行你的函数后，矩阵变为：

 X X X X
 X X X X
 X X X X
 X O X X
 解释:

 被围绕的区间不会存在于边界上，换句话说，任何边界上的 'O' 都不会被填充为 'X'。 任何不在边界上，或不与边界上的 'O' 相连的 'O' 最终都会被填充为 'X'。如果两个元素在水平或垂直方向相邻，则称它们是 “相连” 的。
 */
class Solution {
    func solve(_ board: inout [[Character]]) {
        var visited = board.map { $0.map { _ in false } }
        let height = board.count
        let width = board.first?.count ?? 0
        
        func find(_ row:Int, _ column:Int) {
            if row < 0 || row >= height || column < 0 || column >= width {
                return
            }
            
            if board[row][column] == "X" || visited[row][column] {
                return
            }
            
            visited[row][column] = true
            
            find(row - 1, column)
            find(row + 1, column)
            find(row, column - 1)
            find(row, column + 1)
        }
        
        print(visited)
        
        for i in 0..<width {
            find(0, i)
            find(height - 1, i)
        }
        
        for i in 0..<height {
            find(i, 0)
            find(i, width - 1)
        }
        
        for i in 0..<height {
            for j in 0..<width {
                if board[i][j] == "O" && !visited[i][j] {
                    board[i][j] = "X"
                }
            }
        }
        
    }
}
