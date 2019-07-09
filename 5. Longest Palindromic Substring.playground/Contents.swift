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
        guard !s.isEmpty else {
            return ""
        }
        
        var maxLength = 1
        var start = 0
        for index in 1..<s.count {
            if index - maxLength >= 1 {
                let a = String(s[String.Index(encodedOffset: index - maxLength - 1)..<String.Index(encodedOffset: index + 1)])
                if a == String(a.reversed()) {
                    start = index - maxLength - 1
                    maxLength += 2
                    continue
                }
            }
            
            if index - maxLength >= 0  {
                let a = String(s[String.Index(encodedOffset: index - maxLength)..<String.Index(encodedOffset: index + 1)])
                if a == String(a.reversed()) {
                    start = index - maxLength
                    maxLength += 1
                }
            }
        }
        return String(s[String.Index(encodedOffset: start)..<String.Index(encodedOffset: start + maxLength)])
    }
}

Solution().longestPalindrome(s)
