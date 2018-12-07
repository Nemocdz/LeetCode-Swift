import Cocoa

let n = 6
class Solution {
    func isUgly(_ num: Int) -> Bool {
        if num == 0 {
            return false
        } else if num == 1 {
            return true
        } else {
            var result = num
            while result % 5 == 0 {
                result /= 5
            }
            while result % 3 == 0 {
                result /= 3
            }
            while result % 2 == 0 {
                result /= 2
            }
            return result == 1
        }
    }
}
Solution().isUgly(n)
