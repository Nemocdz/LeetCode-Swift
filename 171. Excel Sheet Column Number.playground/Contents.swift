import Cocoa

/*
 给定一个Excel表格中的列名称，返回其相应的列序号。
 
 例如，
 
 A -> 1
 B -> 2
 C -> 3
 ...
 Z -> 26
 AA -> 27
 AB -> 28
 ...
 示例 1:
 
 输入: "A"
 输出: 1
 示例 2:
 
 输入: "AB"
 输出: 28
 示例 3:
 
 输入: "ZY"
 输出: 701
*/

let s = "ZY"

class Solution {
    func titleToNumber(_ s: String) -> Int {
        var result = 0
        for c in s.unicodeScalars{
            result = result * 26 + Int(c.value - 64)
        }
        return result
    }
}

Solution().titleToNumber(s)

