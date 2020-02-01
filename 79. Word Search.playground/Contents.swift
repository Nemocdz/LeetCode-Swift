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
        var visit = board.map{ $0.map{_ in false } }
        let height = board.count
        let width = board.first?.count ?? 0
        func find(_ row:Int, _ column:Int, _ word:String) -> Bool{
            if word.isEmpty {
                return true
            }
            
            if row < 0 || row >= height || column < 0 || column >= width {
                return false
            }
            
            if visit[row][column] {
                return false
            }
            
            var word = word
            let s = word.removeFirst()
            if s != board[row][column] {
                return false
            }
            
            visit[row][column] = true
            let isFind = find(row - 1, column, word) || find(row, column - 1, word) || find(row + 1, column, word) || find(row, column + 1, word)
            if !isFind {
                visit[row][column] = false
            }
            return isFind
        }
        
        for row in 0..<height {
            for column in 0..<width {
                if find(row, column, word) {
                    return true
                }
            }
        }
        return false
    }
}

Solution().exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCB")
