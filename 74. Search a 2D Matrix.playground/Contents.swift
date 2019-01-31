import Cocoa

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
