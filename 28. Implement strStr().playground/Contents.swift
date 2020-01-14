import Cocoa

/*
 实现 strStr() 函数。
 
 给定一个 haystack 字符串和一个 needle 字符串，在 haystack 字符串中找出 needle 字符串出现的第一个位置 (从0开始)。如果不存在，则返回  -1。
 
 示例 1:
 
 输入: haystack = "hello", needle = "ll"
 输出: 2
 示例 2:
 
 输入: haystack = "aaaaa", needle = "bba"
 输出: -1
 说明:
 
 当 needle 是空字符串时，我们应当返回什么值呢？这是一个在面试中很好的问题。
 
 对于本题而言，当 needle 是空字符串时我们应当返回 0 。这与C语言的 strstr() 以及 Java的 indexOf() 定义相符。
*/

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.isEmpty {
            return 0
        }
        
        if needle.count > haystack.count {
            return -1
        }
        
        func getNext(of s:String) -> [Int] {
            var next = [Int](repeating: 0, count: s.count)
            var i = 0
            // 0 时不相等
            next[0] = -1
            // 前 i 位前后缀相等长度 - 1
            var j = next[i]
            while i < s.count - 1 {
                if j == -1 || s[.init(utf16Offset: i, in: s)] == s[.init(utf16Offset: j, in: s)] {
                    // s[i] == s[j] 时，next[i + 1] = next[i] + 1
                    j += 1
                    i += 1
                    next[i] = j
                } else {
                    // 新的长度为 next[j]
                    j = next[j]
                }
            }
            return next
        }
        
        let next = getNext(of: needle)
        var i = 0
        while i < haystack.count && haystack.count >= i + needle.count {
            // 最长前缀
            var j = 0
            while j < needle.count {
                if haystack[.init(utf16Offset: i + j, in: haystack)] != needle[.init(utf16Offset: j, in: needle)] {
                    break
                }
                j += 1
            }
            
            if j == needle.count {
                return i
            }
            
            // 下一次从最长前缀后往前回滚前后缀相等的长度
            i += j - next[j]
        }
        return -1
    }
}


Solution().strStr("HelloHelloHead", "HelloHea")
