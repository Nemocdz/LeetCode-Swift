import Cocoa

let s = 701

class Solution {
    func convertToTitle(_ n: Int) -> String {
        var a = n
        var result = ""
        while a > 0 {
            a -= 1
            result.insert(Character(UnicodeScalar(65 + a % 26)!), at: result.startIndex)
            a /= 26
        }
        return result
    }
}

Solution().convertToTitle(s)
