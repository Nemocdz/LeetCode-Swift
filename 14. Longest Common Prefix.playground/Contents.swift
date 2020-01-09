import Cocoa

/*
 编写一个函数来查找字符串数组中的最长公共前缀。
 
 如果不存在公共前缀，返回空字符串 ""。
 
 示例 1:
 
 输入: ["flower","flow","flight"]
 输出: "fl"
 示例 2:
 
 输入: ["dog","racecar","car"]
 输出: ""
 解释: 输入不存在公共前缀。
 说明:
 
 所有输入只包含小写字母 a-z 。
*/

let a = ["flower","flow","flight"]

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty {
            return ""
        }
        
        if strs.count == 1 {
            return strs.first!
        }
        
        var strs = strs
        strs.sort { $0.count < $1.count }
        
        var maxString = strs.first!
        
        func getMaxString(of first:String, _ second:String) -> String {
            var end = 0
            while end < first.count && (first[.init(utf16Offset: end, in: first)] == second[.init(utf16Offset: end, in: second)]) {
                end += 1
            }
            return String(first[first.startIndex..<String.Index(utf16Offset: end, in: first)])
        }
        
        for str in strs.dropFirst() {
            maxString = getMaxString(of: maxString, str)
        }
        
        return maxString
    }
}

Solution().longestCommonPrefix(a)
