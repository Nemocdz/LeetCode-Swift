import Cocoa

/*
 所有 DNA 由一系列缩写为 A，C，G 和 T 的核苷酸组成，例如：“ACGAATTCCG”。在研究 DNA 时，识别 DNA 中的重复序列有时会对研究非常有帮助。
 
 编写一个函数来查找 DNA 分子中所有出现超多一次的10个字母长的序列（子串）。
 
 示例:
 
 输入: s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
 
 输出: ["AAAAACCCCC", "CCCCCAAAAA"]
*/

class Solution {
    func findRepeatedDnaSequences(_ s: String) -> [String] {
        guard s.count >= 10 else {
            return []
        }
        
        var dic = [Int:(String,Bool)]()
        var result = [String]()
        
        for i in 0..<s.count - 9 {
            let sub = String(s[String.Index(utf16Offset: i, in: s)..<String.Index(utf16Offset: i + 10, in: s)])
            let key = sub.key()
            if let value = dic[key] {
                if !value.1 {
                    result.append(value.0)
                    dic[key] = (value.0, true)
                }
            } else {
                dic[key] = (sub, false)
            }
        }
        return result
    }
}

extension String {
    func key () -> Int{
        var hash = 0
        forEach{ hash = hash << 2 | $0.toInt() }
        return hash
    }
}

extension Character {
    func toInt() -> Int{
        switch self {
        case "A":
            return 0
        case "C":
            return 1
        case "G":
            return 2
        case "T":
            return 3
        default:
            fatalError()
        }
    }
}

Solution().findRepeatedDnaSequences("AAAAAAAAAAA")
