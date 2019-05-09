import Cocoa

/*
 All DNA is composed of a series of nucleotides abbreviated as A, C, G, and T, for example: "ACGAATTCCG". When studying DNA, it is sometimes useful to identify repeated sequences within the DNA.
 
 Write a function to find all the 10-letter-long sequences (substrings) that occur more than once in a DNA molecule.
 
 Example:
 
 Input: s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
 
 Output: ["AAAAACCCCC", "CCCCCAAAAA"]
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
