import Cocoa

class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else {
            return s
        }
        
        var rows = [String](repeating: "", count: min(numRows, s.count))
        
        var index = 0
        var down = false
        
        for c in s {
            rows[index].append(c)
            if index == 0 || index == numRows - 1 {
                down = !down
            }
            index += down ? 1 : -1
        }
        return rows.reduce(into: "") { $0.append($1) }
    }
}
