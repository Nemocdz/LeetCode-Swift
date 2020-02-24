import Cocoa

/*
 给定一个非负索引 k，其中 k ≤ 33，返回杨辉三角的第 k 行。
 
 
 
 在杨辉三角中，每个数是它左上方和右上方的数的和。
 
 示例:
 
 输入: 3
 输出: [1,3,3,1]
 进阶：
 
 你可以优化你的算法到 O(k) 空间复杂度吗？
*/

class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        if rowIndex == 0 {
            return []
        }
        
        if rowIndex == 1 {
            return [1]
        }
        
        var lastRow = [1]
        
        func createRow() -> [Int] {
            var row = [1]
            for index in 0..<(lastRow.count - 1) {
                row.append(lastRow[index] + lastRow[index + 1])
            }
            row.append(1)
            return row
        }
        
        for _ in 0..<(rowIndex - 1) {
            lastRow = createRow()
        }
        
        return lastRow
    }
}

Solution().getRow(3)
