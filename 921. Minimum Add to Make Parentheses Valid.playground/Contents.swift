import UIKit

let s = "(()))))("

class Solution {
    func minAddToMakeValid(_ S: String) -> Int {
        var i = 0
        var result = 0
        var balance = 0
        while i < S.count {
            balance += S[String.Index(encodedOffset: i)] == "(" ? 1 : -1
            if balance == -1 {
                result += 1
                balance += 1
            }
            i += 1
        }
        return result + balance
    }
}

Solution().minAddToMakeValid(s)
