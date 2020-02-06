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
            return 0
        }
        
        // f[-1] = 1
        var pre = 1
        // f[0] = 1
        var cur = 1
        
        for i in 1..<s.count {
            let preNum = Int(String(s[.init(utf16Offset: i - 1, in: s)]))!
            let num = Int(String(s[.init(utf16Offset: i, in: s)]))!
            
            let temp = cur
            if num == 0 {
                if preNum == 1 || preNum == 2 {
                    // f[n] = f[n - 2]
                    cur = pre
                } else {
                    return 0
                }
            } else if (preNum == 1) || (preNum == 2 && num >= 1 && num <= 6) {
                // f[n] = f[n - 1] + f[n - 2]
                cur = cur + pre
            } else {
                // f[n] = f[n - 1]
            }
            pre = temp
        }
        
        return cur
    }
}
