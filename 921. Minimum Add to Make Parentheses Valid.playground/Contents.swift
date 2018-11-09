import UIKit

let s = "(()))))("

class Solution {
    func minAddToMakeValid(_ S: String) -> Int {
        // how many "(" we need
        var left = 0
        // how many ")" we need
        var right = 0
        
        for c in S {
            if right == 0 && c == ")"{
                left += 1
            } else {
                right += c == "(" ? 1 : -1
            }
        }
        return left + right
    }
}

Solution().minAddToMakeValid(s)
