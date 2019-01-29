import Cocoa

class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        guard grid.count > 0 else {
            return 0
        }
        var paths = [[Int]](repeating: [Int](repeating: 0, count: grid.first!.count), count: grid.count)
        for (i, row) in grid.enumerated() {
            for (j, column) in row.enumerated() {
                if i == 0 && j == 0 {
                    paths[i][j] = column
                } else if i == 0 {
                    paths[i][j] = paths[i][j - 1] + column
                } else if j == 0 {
                    paths[i][j] = paths[i - 1][j] + column
                } else {
                    paths[i][j] = min(paths[i - 1][j], paths[i][j - 1]) + column
                }
            }
        }
        return paths.last!.last!
    }
}
