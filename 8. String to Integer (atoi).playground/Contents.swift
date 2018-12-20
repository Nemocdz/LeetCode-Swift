import Cocoa

let s = "-91283472332"
class Solution {
    func myAtoi(_ str: String) -> Int {
        var startIndex = 0
        for (index, c) in str.enumerated() {
            if c != " " {
                startIndex = index
                break
            }
        }
        
    
        
        var s = String(str[String.Index(encodedOffset: startIndex)..<str.endIndex])
        
        guard !s.isEmpty else {
            return 0
        }
        
        var sign = 1
        if s.first! == "-" || s.first == "+" {
            sign = s.first! == "-" ? -1 : 1
            s = String(s.dropFirst())
        }
        var result = 0
        let a = Int(pow(Double(2), Double(31)))
        let max = a - 1
        let min = -a
        for c in s {
            guard c >= "0" && c <= "9" else {
                break
            }
            
            if result > max / 10 || (result == max / 10 && c > "7") {
                if sign == 1 {
                    return max
                } else {
                    return min
                }
                break
            }
            result  = 10 * result + Int((c.unicodeScalars.first!.value - "0".unicodeScalars.first!.value))
        }
        
        return result * sign
    }
}

Solution().myAtoi(s)
