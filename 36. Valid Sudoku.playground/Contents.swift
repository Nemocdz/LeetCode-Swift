import Cocoa

class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rows = [[Bool]](repeating: [Bool](repeating: false, count: 9), count: 9)
        var columns = [[Bool]](repeating: [Bool](repeating: false, count: 9), count: 9)
        var cube = [[Bool]](repeating: [Bool](repeating: false, count: 9), count: 9)
        
        var result = true
        for (i, row) in board.enumerated(){
            for (j, c) in row.enumerated(){
                guard c != "." else { continue }
                let index = Int(c.unicodeScalars.first!.value) - 49
                let k = i / 3 * 3 + j / 3
                guard !rows[i][index] && !columns[j][index] && !cube[k][index] else {
                    result = false
                    break
                }
                
                rows[i][index] = true
                columns[j][index] = true
                cube[k][index] = true
            }
        }
        return result
    }
}

