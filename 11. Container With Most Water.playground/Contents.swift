import Cocoa

let a = [1,8,6,2,5,4,8,3,7]
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var n = 0
        var m = height.count - 1
        var result = (m - n) * min(height[n], height[m])
        while n < m {
            if height[n] < height[m]{
                n += 1
            } else {
                m -= 1
            }
            result = max((m - n) * min(height[n], height[m]), result)
        }
        return result
    }
}

Solution().maxArea(a)
