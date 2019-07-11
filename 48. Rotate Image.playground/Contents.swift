import Cocoa

/*
 给定一个 n × n 的二维矩阵表示一个图像。
 
 将图像顺时针旋转 90 度。
 
 说明：
 
 你必须在原地旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要使用另一个矩阵来旋转图像。
 
 示例 1:
 
 给定 matrix =
 [
 [1,2,3],
 [4,5,6],
 [7,8,9]
 ],
 
 原地旋转输入矩阵，使其变为:
 [
 [7,4,1],
 [8,5,2],
 [9,6,3]
 ]
 示例 2:
 
 给定 matrix =
 [
 [ 5, 1, 9,11],
 [ 2, 4, 8,10],
 [13, 3, 6, 7],
 [15,14,12,16]
 ],
 
 原地旋转输入矩阵，使其变为:
 [
 [15,13, 2, 5],
 [14, 3, 4, 1],
 [12, 6, 8, 9],
 [16, 7,10,11]
 ]
*/
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


