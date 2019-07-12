import Cocoa

/*
 编写一个高效的算法来判断 m x n 矩阵中，是否存在一个目标值。该矩阵具有如下特性：
 
 每行中的整数从左到右按升序排列。
 每行的第一个整数大于前一行的最后一个整数。
 示例 1:
 
 输入:
 matrix = [
 [1,   3,  5,  7],
 [10, 11, 16, 20],
 [23, 30, 34, 50]
 ]
 target = 3
 输出: true
 示例 2:
 
 输入:
 matrix = [
 [1,   3,  5,  7],
 [10, 11, 16, 20],
 [23, 30, 34, 50]
 ]
 target = 13
 输出: false
*/

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty && !matrix.first!.isEmpty else {
            return false
        }
        var result = false
        for row in matrix.reversed() {
            if row.first! == target {
                result = true
                break
            } else if row.first! > target {
                continue
            } else {
                for column in row {
                    if column == target {
                        result = true
                        break
                    }
                }
            }
        }
        return result
    }
}
