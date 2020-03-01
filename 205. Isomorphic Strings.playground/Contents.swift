import Cocoa

/*
 给定两个字符串 s 和 t，判断它们是否是同构的。
 
 如果 s 中的字符可以被替换得到 t ，那么这两个字符串是同构的。
 
 所有出现的字符都必须用另一个字符替换，同时保留字符的顺序。两个字符不能映射到同一个字符上，但字符可以映射自己本身。
 
 示例 1:
 
 输入: s = "egg", t = "add"
 输出: true
 示例 2:
 
 输入: s = "foo", t = "bar"
 输出: false
 示例 3:
 
 输入: s = "paper", t = "title"
 输出: true
 说明:
 你可以假设 s 和 t 具有相同的长度。
*/

let s = "egg"
let t = "bar"

class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var map1 = [Character:Character]()
        var map2 = [Character:Character]()
        
        for (a, b) in zip(s, t) {
            if let value = map1[a], value != b {
                return false
            }
            
            if let value = map2[b], value != a {
                return false
            }
            
            map1[a] = b
            map2[b] = a
        }
        
        return true
    }
}

Solution().isIsomorphic(s, t)
