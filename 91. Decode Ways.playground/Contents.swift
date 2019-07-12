import Cocoa

/*
 一条包含字母 A-Z 的消息通过以下方式进行了编码：
 
 'A' -> 1
 'B' -> 2
 ...
 'Z' -> 26
 给定一个只包含数字的非空字符串，请计算解码方法的总数。
 
 示例 1:
 
 输入: "12"
 输出: 2
 解释: 它可以解码为 "AB"（1 2）或者 "L"（12）。
 示例 2:
 
 输入: "226"
 输出: 3
 解释: 它可以解码为 "BZ" (2 26), "VF" (22 6), 或者 "BBF" (2 2 6) 。
*/

class Solution {
    func numDecodings(_ s: String) -> Int {
        if s == "" {
            return 1
        }
        var result = 1
        var pre = ""
        var preResult = 0
        for c in s {
            let current = String(c)
            let num = Int(pre + current)!
            (preResult, result) = (result, result * ((Int(current)! > 0) ? 1 : 0) + ((num > 9 && num < 27) ? 1 : 0) * preResult)
            pre = current
        }
        return result
    }
}
