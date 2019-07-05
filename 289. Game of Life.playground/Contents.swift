import Cocoa

/*
 According to the Wikipedia's article: "The Game of Life, also known simply as Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970."
 
 Given a board with m by n cells, each cell has an initial state live (1) or dead (0). Each cell interacts with its eight neighbors (horizontal, vertical, diagonal) using the following four rules (taken from the above Wikipedia article):
 
 Any live cell with fewer than two live neighbors dies, as if caused by under-population.
 Any live cell with two or three live neighbors lives on to the next generation.
 Any live cell with more than three live neighbors dies, as if by over-population..
 Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.
 Write a function to compute the next state (after one update) of the board given its current state. The next state is created by applying the above rules simultaneously to every cell in the current state, where births and deaths occur simultaneously.
 
 Example:
 
 Input:
 [
 [0,1,0],
 [0,0,1],
 [1,1,1],
 [0,0,0]
 ]
 Output:
 [
 [0,0,0],
 [1,0,1],
 [0,1,1],
 [0,1,0]
 ]
*/

class Solution {
    func gameOfLife(_ board: inout [[Int]]) {
        let m = board.count
        let n = board.first!.count
    
        board = board.enumerated().map{ i, states in
            return states.enumerated().map{ j, state in
                func liveNeighborsNum(at i:Int, _ j:Int) -> Int {
                    var count = 0
                    for x in max(i - 1, 0)..<min(i + 1, m - 1) + 1 {
                        for y in max(j - 1, 0)..<min(j + 1, n - 1) + 1 {
                            count += (x == i && y == j) ? 0 : board[x][y] & 1
                        }
                    }
                    return count
                }
                let liveNum = liveNeighborsNum(at: i, j)
                if state == 1 && (liveNum == 2 || liveNum == 3) {
                    return 0b11
                } else if state == 0 && liveNum == 3 {
                    return 0b10
                } else {
                    return state
                }
            }
        }.map{ states in
            return states.map{ state in
                return state >> 1
            }
        }
    }
}

