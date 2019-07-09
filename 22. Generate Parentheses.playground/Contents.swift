import Cocoa

/*
 给出 n 代表生成括号的对数，请你写出一个函数，使其能够生成所有可能的并且有效的括号组合。
 
 例如，给出 n = 3，生成结果为：
 
 [
 "((()))",
 "(()())",
 "(())()",
 "()(())",
 "()()()"
 ]
*/

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        if n == 0 {
            return [""]
        } else {
            var result = [String]()
            for index in 0..<n {
                for left in generateParenthesis(index) {
                    for right in generateParenthesis(n - index - 1) {
                        result.append("(" + left  + ")" + right)
                    }
                }
            } 
            return result
        }
    }
}


Solution().generateParenthesis(2)
