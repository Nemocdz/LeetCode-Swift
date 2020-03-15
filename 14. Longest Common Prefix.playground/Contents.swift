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

        let first = Array(strs.first!)
        for (index, c) in first.enumerated() {
            for str in strs.dropFirst() {
                let str = Array(str)
                if index >= str.count || str[index] != c {
                    return String(first[0..<index])
                }
            }
        }
        return String(first)
    }
}

Solution().longestCommonPrefix(a)
