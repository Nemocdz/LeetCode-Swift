import Cocoa

var s = [0,1,0,3,12]

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        let zeros = nums.filter({$0 == 0})
        nums = nums.filter({$0 != 0})
        nums.append(contentsOf: zeros)
    }
}

Solution().moveZeroes(&s)
