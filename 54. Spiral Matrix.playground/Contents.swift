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
        if matrix.first?.first == nil {
            return []
        }
        
        let height = matrix.count
        let width = matrix.first?.count ?? 0
        
        var start = 0
        var answers = [Int]()
        while height > start * 2 && width > start * 2 {
            let endX = width - 1 - start
            let endY = height - 1 - start
            
            // 左上 -> 右上
            for i in start...endX {
                answers.append(matrix[start][i])
            }
            
            // 左上下1 -> 右下
            if start < endY {
                for i in (start + 1)...endY {
                    answers.append(matrix[i][endX])
                }
            }
            
            // 右下左1 -> 左下
            if start < endX && start < endY {
                for i in (start...(endX - 1)).reversed() {
                    answers.append(matrix[endY][i])
                }
            }
            
            // 左下上1 -> 右上下1
            if start < endX && start < endY - 1 {
                for i in ((start + 1)...(endY - 1)).reversed() {
                    answers.append(matrix[i][start])
                }
            }
            
            start += 1
        }
        
        return answers
    }
}
