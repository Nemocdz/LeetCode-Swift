import Cocoa

/*
 给定一个 m x n 的矩阵，如果一个元素为 0，则将其所在行和列的所有元素都设为 0。请使用原地算法。
 
 示例 1:
 
 输入:
 [
     [1,1,1],
     [1,0,1],
     [1,1,1]
 ]
 输出:
 [
     [1,0,1],
     [0,0,0],
     [1,0,1]
 ]
 示例 2:
 
 输入:
 [
     [0,1,2,0],
     [3,4,5,2],
     [1,3,1,5]
 ]
 输出:
 [
     [0,0,0,0],
     [0,4,5,0],
     [0,3,1,0]
 ]
 进阶:
 
 一个直接的解决方案是使用  O(mn) 的额外空间，但这并不是一个好的解决方案。
 一个简单的改进方案是使用 O(m + n) 的额外空间，但这仍然不是最好的解决方案。
 你能想出一个常数空间的解决方案吗？
*/

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
