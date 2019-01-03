import Cocoa

class Solution {
    func countAndSay(_ n: Int) -> String {
        guard n > 0 else {
            return ""
        }
        if n == 1 {
            return "1"
        }else if n == 2 {
            return "11"
        }
        let numString = countAndSay(n - 1)
        var result = ""
        var temp = numString.first!
        var startIndex = 0
        
        for (index, c) in numString.enumerated().dropFirst() {
            if index == numString.count - 1 {
                if c == temp {
                    result += "\(index - startIndex + 1)\(temp)"
                } else {
                    result += "\(index - startIndex)\(temp)"
                    result += "1\(c)"
                }
            } else {
                if c != temp {
                    result += "\(index - startIndex)\(temp)"
                    startIndex = index
                    temp = c
                }
            }
        }
        return result
    }
}

Solution().countAndSay(5)
