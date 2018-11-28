import Cocoa

let num = 200

class Solution {
    func trailingZeroes(_ n: Int) -> Int {
        guard n >= 5 else {
            return 0
        }
        
        var result = 0
        var five = 5
        
        while five <= n {
            result += n / five
            five *= 5
        }
        
        return result
    }
}

Solution().trailingZeroes(num)
