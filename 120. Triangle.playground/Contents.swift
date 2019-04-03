import Cocoa

/*
Given a triangle, find the minimum path sum from top to bottom. Each step you may move to adjacent numbers on the row below.

For example, given the following triangle

[
   [2],
  [3,4],
 [6,5,7],
[4,1,8,3]
]
The minimum path sum from top to bottom is 11 (i.e., 2 + 3 + 5 + 1 = 11).

Note:

Bonus point if you are able to do this using only O(n) extra space, where n is the total number of rows in the triangle.
*/

let a = [[2],[3,4],[6,5,7],[4,1,8,3]]

class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        guard !triangle.isEmpty else {
            return 0
        }
        
        var triangle = triangle
        
        for (i, _) in triangle.enumerated().dropFirst() {
            let pre = triangle[i - 1]
            var current = triangle[i]
            current[0] += pre[0]
            current[i] += pre[i - 1]
            for j in 1..<i {
                current[j] += min(pre[j], pre[j - 1])
            }
            triangle[i] = current
        }
        
        return triangle.last!.min()!
    }
}

Solution().minimumTotal(a)
