import Cocoa

class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        for offset in 0..<(matrix.count / 2) {
            for i in 0..<matrix.count - 1 - 2 * offset {
                let leftUp = (offset, offset + i)
                let rightUp = (offset + i, matrix.count - 1 - offset)
                let rightBottom = (matrix.count - 1 - offset, matrix.count - 1 - offset - i)
                let leftBottom = (matrix.count - 1 - offset - i, offset)
                let temp = matrix[rightUp.0][rightUp.1]
                matrix[rightUp.0][rightUp.1] = matrix[leftUp.0][leftUp.1]
                matrix[leftUp.0][leftUp.1] = matrix[leftBottom.0][leftBottom.1]
                matrix[leftBottom.0][leftBottom.1] = matrix[rightBottom.0][rightBottom.1]
                matrix[rightBottom.0][rightBottom.1] = temp
            }
        }
    }
}


