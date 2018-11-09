import UIKit

let s = "()))(("

class Solution {
    func minAddToMakeValid(_ S: String) -> Int {
        var i = 0
        var j = S.count - 1
        var result = 0
        while i <= j {
            let a = String.Index.init(encodedOffset: i)
            let b = String.Index.init(encodedOffset: j)
            if S[a] != S[b] {
                i += 1
                j -= 1
            } else {
                i += 1
                result += 1
            }
        }
        return result
    }
}

Solution().minAddToMakeValid(s)
