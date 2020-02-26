import Cocoa

/*
 给定一个由 '1'（陆地）和 '0'（水）组成的的二维网格，计算岛屿的数量。一个岛被水包围，并且它是通过水平方向或垂直方向上相邻的陆地连接而成的。你可以假设网格的四个边均被水包围。

 示例 1:

 输入:
 11110
 11010
 11000
 00000

 输出: 1
 示例 2:

 输入:
 11000
 11000
 00100
 00011

 输出: 3
 */

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var visited = grid.map{ $0.map{ _ in false } }
        let height = grid.count
        let width = grid.first?.count ?? 0
        var answer = 0
        
        func visitIsland(_ row:Int, _ column:Int) {
            if row < 0 || row >= height || column < 0 || column >= width {
                return
            }
            
            if grid[row][column] == "0" {
                return
            }
            
            if visited[row][column] {
                return
            }
            
            visited[row][column] = true
            
            visitIsland(row - 1, column)
            visitIsland(row + 1, column)
            visitIsland(row, column - 1)
            visitIsland(row, column + 1)
        }
    
        for row in 0..<height {
            for column in 0..<width {
                if grid[row][column] == "1" && !visited[row][column] {
                    visitIsland(row, column)
                    answer += 1
                }
            }
        }
        
        return answer
    }
}
