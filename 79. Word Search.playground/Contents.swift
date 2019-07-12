import Cocoa

/*
 给定一个二维网格和一个单词，找出该单词是否存在于网格中。
 
 单词必须按照字母顺序，通过相邻的单元格内的字母构成，其中“相邻”单元格是那些水平相邻或垂直相邻的单元格。同一个单元格内的字母不允许被重复使用。
 
 示例:
 
 board =
 [
 ['A','B','C','E'],
 ['S','F','C','S'],
 ['A','D','E','E']
 ]
 
 给定 word = "ABCCED", 返回 true.
 给定 word = "SEE", 返回 true.
 给定 word = "ABCB", 返回 false.
*/

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        guard !board.isEmpty else {
            return false
        }
        
        var visit = board.map{ $0.map{_ in false } }
        
        func find(_ row:Int, _ column:Int, _ word:String) -> Bool{
            guard !visit[row][column] else {
                return false
            }
            if word.isEmpty {
                return true
            }
            let s = word.first!
            var result = false
            let aWord = String(word.dropFirst())
            
            visit[row][column] = true
            
            if row > 0 && s == board[row - 1][column] && !result {
                result = find(row - 1, column, aWord)
            }
            if column > 0 && s == board[row][column - 1] && !result {
                result = find(row, column - 1, aWord)
            }
            if row < board.count - 1 && s == board[row + 1][column] && !result{
                result = find(row + 1, column, aWord)
            }
            if column < board.first!.count - 1 && s == board[row][column + 1] && !result {
                result = find(row, column + 1, aWord)
            }
            
            visit[row][column] = result ? true : false
            return result
        }
        var result = false
        for row in 0..<board.count {
            for column in 0..<board.first!.count {
                if word.first! == board[row][column] && !result {
                    result = find(row, column, String(word.dropFirst()))
                }
            }
        }
        return result
    }
}
