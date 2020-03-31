import Cocoa

/*
 给定一个字符串 s，将 s 分割成一些子串，使每个子串都是回文串。

 返回 s 所有可能的分割方案。

 示例:

 输入: "aab"
 输出:
 [
   ["aa","b"],
   ["a","a","b"]
 ]
 */

class Solution {
    func partition(_ s: String) -> [[String]] {
        let s = Array(s)
        var dp = (0..<s.count).map{ _ in (0..<s.count).map { _ in false } }
        for end in 0..<s.count {
            for start in 0...end {
                // dp[i][j] = s[i] == s[j] && dp[i + 1][j - 1]
                if s[start] == s[end] && (end - start <= 2 || dp[start + 1][end - 1]) {
                    dp[start][end] = true
                }
            }
        }
        
        var temp = [String]()
        var answers = [[String]]()
        
        func _partition(_ start:Int) {
            if start == s.count {
                answers.append(temp)
            } else {
                for i in start..<s.count {
                    if !dp[start][i] {
                        continue
                    }
                    temp.append(String(s[start..<(i + 1)]))
                    _partition(i + 1)
                    temp.removeLast()
                }
            }
        }
        
        _partition(0)
        return answers
    }
}
