import Cocoa

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
