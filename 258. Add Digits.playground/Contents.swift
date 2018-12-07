import Cocoa

let n = 38
class Solution {
    func addDigits(_ num: Int) -> Int {
        return num == 0 ? 0 :(num - 1) % 9 + 1
    }
}

Solution().addDigits(n)
