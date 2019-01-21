import Cocoa

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
