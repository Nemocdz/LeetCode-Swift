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
        let words = str.split(separator: " ").map{ String($0) }
        
        if words.count != pattern.count {
            return false
        }
        
        var map1 = [Character:String]()
        var map2 = [String:Character]()
        
        for (char, word) in zip(pattern, words) {
            if let value = map1[char], value != word {
                return false
            }
            
            if let value = map2[word], value != char {
                return false
            }
            
            map1[char] = word
            map2[word] = char
        }
    
        return true
    }
}

Solution().wordPattern(p, s)
