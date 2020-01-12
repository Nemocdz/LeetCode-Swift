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
        }
        
        var answers = [String]()
        for i in 0..<n {
            for left in generateParenthesis(i) {
                for right in generateParenthesis(n - i - 1) {
                    answers.append("(" + left + ")" + right)
                }
            }
        }
        
        return answers
    }
}


Solution().generateParenthesis(2)
