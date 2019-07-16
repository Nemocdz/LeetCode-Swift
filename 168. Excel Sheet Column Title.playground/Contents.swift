import Cocoa

/*
 给定一个正整数，返回它在 Excel 表中相对应的列名称。
 
 例如，
 
 1 -> A
 2 -> B
 3 -> C
 ...
 26 -> Z
 27 -> AA
 28 -> AB
 ...
 示例 1:
 
 输入: 1
 输出: "A"
 示例 2:
 
 输入: 28
 输出: "AB"
 示例 3:
 
 输入: 701
 输出: "ZY"
*/

let s = 701

class Solution {
    func convertToTitle(_ n: Int) -> String {
        var a = n
        var result = ""
        while a > 0 {
            a -= 1
            result.insert(Character(UnicodeScalar(65 + a % 26)!), at: result.startIndex)
            a /= 26
        }
        return result
    }
}

Solution().convertToTitle(s)
