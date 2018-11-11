import Cocoa

let x = 121

class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else {
            return false
        }
        
        var temp = x
        var result = 0
        while temp != 0 {
            result = result * 10 + temp % 10
            temp /= 10
        }
        return result == x
    }
}

Solution().isPalindrome(x)

