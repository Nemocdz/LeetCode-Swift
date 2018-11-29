import Cocoa

let s = 19

class Solution {
    func isHappy(_ n: Int) -> Bool {
        var slow = n
        var fast = n
        repeat{
            slow = sumOfNum(slow)
            fast = sumOfNum(fast)
            fast = sumOfNum(fast)
        } while slow != fast
        return slow == 1
    }
    
    func sumOfNum(_ num: Int) -> Int{
        var n = num
        var sum = 0
        while n > 0 {
            let temp = n % 10
            sum += temp * temp
            n /= 10
        }
        return sum
    }
}

Solution().isHappy(s)
