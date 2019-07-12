import Cocoa

/*
 给定一个正整数 n，生成一个包含 1 到 n2 所有元素，且元素按顺时针顺序螺旋排列的正方形矩阵。
 
 示例:
 
 输入: 3
 输出:
 [
 [ 1, 2, 3 ],
 [ 8, 9, 4 ],
 [ 7, 6, 5 ]
 ]
*/

class Solution {
    func generateMatrix(_ n: Int) -> [[Int]] {
        guard n > 0 else {
            return []
        }
        var result = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
        var m = 1
        for offset in 0..<lround(Double(n) / 2.0) {
            if n - offset - 1 > offset {
                for i in offset..<n - offset - 1{
                    result[offset][i] = m
                    m += 1
                }
                if n - offset - 1 > offset {
                    for i in offset..<n - offset - 1 {
                        result[i][n - 1 - offset] = m
                        m += 1
                    }
                    
                    if n - offset > offset + 1 {
                        for i in (offset + 1..<n - offset).reversed() {
                            result[n - 1 - offset][i] = m
                            m += 1
                        }
                        if n - offset > offset + 1 {
                            for i in (offset + 1..<n - offset).reversed() {
                                result[i][offset] = m
                                m += 1
                            }
                        }
                    }
                } else if offset == n - offset - 1 {
                    result[offset][n - 1 - offset] = m
                    m += 1
                }
            } else if offset == n - offset - 1 {
                result[offset][offset] = m
                m += 1
                if n - offset - 1 > offset {
                    for i in (offset + 1..<n - offset) {
                        result[i][offset] = m
                        m += 1
                    }
                }
            }
        }
        return result
    }
}
