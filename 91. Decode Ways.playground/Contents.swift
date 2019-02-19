import Cocoa

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
