import Cocoa

/*
 给定一个只包含数字的字符串，复原它并返回所有可能的 IP 地址格式。
 
 示例:
 
 输入: "25525511135"
 输出: ["255.255.11.135", "255.255.111.35"]
*/

class Solution {
    func restoreIpAddresses(_ s: String) -> [String] {
        if s.count < 4 {
            return []
        }
        
        var answers = [String]()
        
        for i in 1...min(3, s.count - 3) {
            for j in i + 1...min(i + 3, s.count - 2) {
                for k in j + 1...min(j + 3, s.count - 1) {
                    func vaildSegment(_ start:Int, _ end:Int) -> String? {
                        let startIndex = String.Index(utf16Offset: start, in: s)
                        let endIndex = String.Index(utf16Offset: end, in: s)
                        let subString = s[startIndex..<endIndex]
                        if subString.first! == "0" && subString.count > 1 {
                            return nil
                        }
                        if let num = Int(subString), num >= 0 && num < 256 {
                            return String(subString)
                        }
                        return nil
                    }
                    
                    if let a = vaildSegment(0, i),
                        let b = vaildSegment(i, j),
                        let c = vaildSegment(j, k),
                        let d = vaildSegment(k, s.count) {
                        answers.append("\(a).\(b).\(c).\(d)")
                    }
                }
            }
        }
        return answers
    }
}
