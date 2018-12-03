import Cocoa

let s = 218
class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        guard n > 0 else {
            return false
        }
        var a = n
        var result = true
        while a > 1 {
            guard a % 2 == 0 else{
                result = false
                break
            }
            a /= 2
        }
        return result
    }
}

Solution().isPowerOfTwo(s)
