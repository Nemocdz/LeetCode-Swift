import Cocoa

/*
 Given a positive integer n, find the least number of perfect square numbers (for example, 1, 4, 9, 16, ...) which sum to n.
 
 Example 1:
 
 Input: n = 12
 Output: 3
 Explanation: 12 = 4 + 4 + 4.
 Example 2:
 
 Input: n = 13
 Output: 2
 Explanation: 13 = 4 + 9.
*/

class Solution {
    func numSquares(_ n: Int) -> Int {
        var records = (0..<n+1).map{ $0 }
        for i in 1..<n + 1 {
            var j = 1
            while j * j <= i {
                records[i] = min(records[i - j * j] + 1, records[i])
                j += 1
            }
        }
        return records.last!
    }
}
