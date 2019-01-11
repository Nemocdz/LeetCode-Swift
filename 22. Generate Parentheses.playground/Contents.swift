import Cocoa

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
