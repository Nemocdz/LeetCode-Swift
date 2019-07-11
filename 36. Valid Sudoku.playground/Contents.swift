import Cocoa

/*
 判断一个 9x9 的数独是否有效。只需要根据以下规则，验证已经填入的数字是否有效即可。
 
 数字 1-9 在每一行只能出现一次。
 数字 1-9 在每一列只能出现一次。
 数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。
 
 
 上图是一个部分填充的有效的数独。
 
 数独部分空格内已填入了数字，空白格用 '.' 表示。
*/

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

