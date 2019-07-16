import Cocoa

/*
 给定一种规律 pattern 和一个字符串 str ，判断 str 是否遵循相同的规律。
 
 这里的 遵循 指完全匹配，例如， pattern 里的每个字母和字符串 str 中的每个非空单词之间存在着双向连接的对应规律。
 
 示例1:
 
 输入: pattern = "abba", str = "dog cat cat dog"
 输出: true
 示例 2:
 
 输入:pattern = "abba", str = "dog cat cat fish"
 输出: false
 示例 3:
 
 输入: pattern = "aaaa", str = "dog cat cat dog"
 输出: false
 示例 4:
 
 输入: pattern = "abba", str = "dog dog dog dog"
 输出: false
 说明:
 你可以假设 pattern 只包含小写字母， str 包含了由单个空格分隔的小写字母。
*/

let p = "abba"
let s = "dog cat cat dog"

class Solution {
    func wordPattern(_ pattern: String, _ str: String) -> Bool {
        let words = str.split(separator: " ").map({String($0)})
        let chars = pattern.map({$0})
        
        guard words.count == chars.count else {
            return false
        }
        
        var result = true
        var map = [Character: String]()
        for index in 0..<words.count {
            if map.keys.contains(chars[index]){
                if map[chars[index]] != words[index] {
                    result = false
                    break
                }
            } else {
                if map.values.contains(words[index]) {
                    result = false
                    break
                } else {
                    map[chars[index]] = words[index]
                }
            }
        }
        return result
    }
}

Solution().wordPattern(p, s)
