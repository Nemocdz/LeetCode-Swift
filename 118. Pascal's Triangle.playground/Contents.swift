import Cocoa

/*
 在杨辉三角中，每个数是它左上方和右上方的数的和。
 
 示例:
 
 输入: 5
 输出:
 [
 [1],
 [1,1],
 [1,2,1],
 [1,3,3,1],
 [1,4,6,4,1]
 ]
*/

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        if numRows == 0 {
            return []
        }
        
        if numRows == 1 {
            return [[1]]
        }
        
        var lastRow = [1]
        var answers = [lastRow]
        
        func createRow() -> [Int] {
            var row = [1]
            for index in 0..<(lastRow.count - 1) {
                row.append(lastRow[index] + lastRow[index + 1])
            }
            row.append(1)
            return row
        }
        
        for _ in 0..<(numRows - 1) {
            lastRow = createRow()
            answers.append(lastRow)
        }
        
        return answers
    }
}

Solution().generate(5)
