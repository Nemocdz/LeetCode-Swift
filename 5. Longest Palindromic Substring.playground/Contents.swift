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
    
        var map = [[Bool]](repeating: [Bool](repeating: false, count: s.count), count: s.count)
        var length = 0
        var maxString = ""
        
        for end in 0..<s.count {
            for start in 0...end {
                let startIndex = String.Index(utf16Offset: start, in: s)
                let endIndex = String.Index(utf16Offset: end, in: s)
                let last = s[startIndex] == s[endIndex]
                map[start][end] = end - start < 2 ? last : last && map[start + 1][end - 1]
                let new = end - start + 1
                if map[start][end] && new > length {
                    length = new
                    maxString = String(s[startIndex...endIndex])
                }
            }
        }
        
        return maxString
    }
}

Solution().longestPalindrome(s)
