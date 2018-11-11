import Cocoa

let x = -90000

class Solution {
    func reverse(_ x: Int) -> Int {
        let result = Int(String(String(abs(x)).reversed()))!
        guard result < 1<<31 - 1 else {
            return 0
        }
        return x > 0 ? result : -result
    }
}

Solution().reverse(x)

