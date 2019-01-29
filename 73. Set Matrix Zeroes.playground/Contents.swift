import Cocoa

class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        var firstColumn = false
        for (i, row) in matrix.enumerated() {
            for (j, column) in row.enumerated(){
                if column == 0 {
                    if j == 0 {
                        firstColumn = true
                    } else {
                        matrix[0][j] = 0
                        matrix[i][0] = 0
                    }
                }
            }
        }
        for (i, row) in matrix.enumerated().dropFirst() {
            for (j, _) in row.enumerated().dropFirst() {
                if matrix[0][j] == 0 || matrix[i][0] == 0 {
                    matrix[i][j] = 0
                }
            }
        }
        
        if matrix.first?.first == 0 {
            for j in 0..<matrix.first!.count {
                matrix[0][j] = 0
            }
        }
        
        if firstColumn {
            for i in 0..<matrix.count {
                matrix[i][0] = 0
            }
        }
    }
}
