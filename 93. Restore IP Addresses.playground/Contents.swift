import Cocoa

class Solution {
    func restoreIpAddresses(_ s: String) -> [String] {
        var result = [String]()
        guard s.count >= 4 else {
            return result
        }
        for i in 0..<min(4, s.count - 2) {
            for j in i + 1..<min(i + 4, s.count - 1) {
                for k in j + 1..<min(j + 4, s.count) {
                    let a = s.subString(start: 0, end: i)
                    let b = s.subString(start: i, end: j)
                    let c = s.subString(start: j, end: k)
                    let d = s.subString(start: k, end: s.count)
                    if a.isValidSegment && b.isValidSegment && c.isValidSegment && d.isValidSegment {
                        result.append(a + "." + b + "." + c + "." + d)
                    }
                }
            }
        }
        return result
    }
}

extension String{
    var isValidSegment:Bool {
        if isEmpty {
            return false
        }
        if count > 3 {
            return false
        }
        if first! == "0" && count > 1 {
            return false
        }
        if Int(self)! > 255 {
            return false
        }
        return true
    }
    
    func subString(start:Int, end:Int) -> String {
        let startIndex = String.Index(encodedOffset: start)
        let endIndex = String.Index(encodedOffset: end)
        return String(self[startIndex..<endIndex])
    }
}
