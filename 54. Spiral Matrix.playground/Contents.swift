import Cocoa

/*
 给定一个包含 m x n 个元素的矩阵（m 行, n 列），请按照顺时针螺旋顺序，返回矩阵中的所有元素。
 
 示例 1:
 
 输入:
 [
 [ 1, 2, 3 ],
 [ 4, 5, 6 ],
 [ 7, 8, 9 ]
 ]
 输出: [1,2,3,6,9,8,7,4,5]
 示例 2:
 
 输入:
 [
 [1, 2, 3, 4],
 [5, 6, 7, 8],
 [9,10,11,12]
 ]
 输出: [1,2,3,4,8,12,11,10,9,5,6,7]
*/

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        guard matrix.count > 0 else {
            return []
        }
        let height = matrix.count
        let width = matrix.first!.count
        var result = [Int]()
        for offset in 0..<lround(Double(min(height, width)) / 2.0) {
            if width - offset - 1 > offset {
                for i in offset..<width - offset - 1{
                    result.append(matrix[offset][i])
                }
                if height - offset - 1 > offset {
                    for i in offset..<height - offset - 1 {
                        result.append(matrix[i][width - 1 - offset])
                    }
                    
                    if width - offset > offset + 1 {
                        for i in (offset + 1..<width - offset).reversed() {
                            result.append(matrix[height - 1 - offset][i])
                        }
                        if height - offset > offset + 1 {
                            for i in (offset + 1..<height - offset).reversed() {
                                result.append(matrix[i][offset])
                            }
                        }
                    }
                } else if offset == height - offset - 1 {
                    result.append(matrix[offset][width - 1 - offset])
                }
            } else if offset == width - offset - 1 {
                result.append(matrix[offset][offset])
                if height - offset - 1 > offset {
                    for i in (offset + 1..<height - offset) {
                        result.append(matrix[i][offset])
                    }
                }
            }
        }
        return result
    }
}
