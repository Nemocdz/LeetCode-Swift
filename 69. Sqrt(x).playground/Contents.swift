import Cocoa


let s = 8
class Solution {
    func mySqrt(_ x: Int) -> Int {
        return Int(sqrt(Double(x)))
    }
}

Solution().mySqrt(s)
