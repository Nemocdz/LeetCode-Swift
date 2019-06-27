import Cocoa

/*
 Write a program to find the n-th ugly number.
 
 Ugly numbers are positive numbers whose prime factors only include 2, 3, 5.
 
 Example:
 
 Input: n = 10
 Output: 12
 Explanation: 1, 2, 3, 4, 5, 6, 8, 9, 10, 12 is the sequence of the first 10 ugly numbers.
*/

class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        guard n > 0 else {
            return -1
        }
        
        var uglyNumbers = [1]
        var i2 = 0
        var i3 = 0
        var i5 = 0
        
        while uglyNumbers.count < n {
            let v2 = uglyNumbers[i2] * 2
            let v3 = uglyNumbers[i3] * 3
            let v5 = uglyNumbers[i5] * 5
            let v = min(v2, v3, v5)
            if v == v2 {
                i2 += 1
            }
            if v == v3 {
                i3 += 1
            }
            if v == v5 {
                i5 += 1
            }
            uglyNumbers.append(v)
        }
        return uglyNumbers.last!
    }
}

Solution().nthUglyNumber(10)
