import Cocoa

/*
 给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。
 
 示例 1：
 
 输入: "babad"
 输出: "bab"
 注意: "aba" 也是一个有效答案。
 示例 2：
 
 输入: "cbbd"
 输出: "bb"
*/

let s = "babad"
class Solution {
    func longestPalindrome(_ s: String) -> String {
        if s.isEmpty {
            return ""
        }
        
        let s = Array(s)
        
        var start = 0
        var end = 0
    
        func palindromeLength(_ l:Int, _ r:Int) -> Int {
            var l = l
            var r = r
            while l >= 0 && r < s.count && s[l] == s[r] {
                l -= 1
                r += 1
            }
            return r - l - 1
        }
        
        for i in 0..<s.count {
            let length = max(palindromeLength(i, i), palindromeLength(i, i + 1))
            
            if length > end - start {
                start = i - (length - 1) / 2
                end = i + length / 2
            }
            
            if end - start > (s.count - i) * 2 {
                break
            }
        }
        
        return String(s[start...end])
    }
    
    func longestPalindrome2(_ s: String) -> String {
        if s.isEmpty {
            return ""
        }
        
        var dp = (0..<s.count).map{_ in (0..<s.count).map{_ in false } }
        var answer = ""
        let s = Array(s)
        
        for end in 0..<s.count {
            for start in 0...end {
                // dp[i][j] = dp[i + 1][j - 1] && s[i] == s[j]
                let isPalindrome = end - start < 2 ? s[start] == s[end] : s[start] == s[end] && dp[start + 1][end - 1]
                dp[start][end] = isPalindrome
                if isPalindrome && (end - start + 1) > answer.count {
                    answer = String(s[start...end])
                }
            }
        }
        return answer
    }

}

Solution().longestPalindrome(s)
