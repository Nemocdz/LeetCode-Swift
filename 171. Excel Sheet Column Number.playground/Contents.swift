import Cocoa

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

