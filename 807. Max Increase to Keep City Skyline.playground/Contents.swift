import Cocoa

let grid = [[3,0,8,4],[2,4,5,7],[9,2,6,3],[0,3,1,0]]

class Solution{
    func maxIncreaseKeepingSkyline(_ grid: [[Int]]) -> Int {
        var result = 0
        var horizontalMaxInts = [Int]()
        for verticalInts in grid{
            for (j, height) in verticalInts.enumerated(){
                if horizontalMaxInts.count > j {
                    horizontalMaxInts[j] = max(horizontalMaxInts[j], height)
                } else {
                    horizontalMaxInts.append(height)
                }
            }
        }
        
        for verticalInts in grid{
            for (j, height) in verticalInts.enumerated(){
                result += min(horizontalMaxInts[j], verticalInts.max()!) - height
            }
        }
        
        return result
    }
}

Solution().maxIncreaseKeepingSkyline(grid)
