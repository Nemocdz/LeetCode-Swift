import Cocoa
let a = [[0,0,0],[0,1,0],[0,0,0]]
class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        var paths = obstacleGrid.map{ $0.map{ _ in 0 } }
        for (i, row) in obstacleGrid.enumerated() {
            for (j, point) in row.enumerated() {
                if point == 1 {
                    paths[i][j] = 0
                } else if i == 0 && j == 0 {
                    paths[i][j] = 1
                } else {
                    paths[i][j] = (i > 0 ? paths[i - 1][j] : 0) + (j > 0 ? paths[i][j - 1] : 0)
                }
            }
        }
        return obstacleGrid.first!.first! == 1 ? 0 : paths.last!.last!
    }
}

Solution().uniquePathsWithObstacles(a)
