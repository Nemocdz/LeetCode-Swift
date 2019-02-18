import Cocoa

class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var nums = nums
        nums.sort()
        var result = [[Int]]()
        result.append([])
        var size = 0
        for (i,num) in nums.enumerated() {
            let start = i > 0 && num == nums[i - 1] ? size : 0
            size = result.count
            for j in start..<result.count {
                var subSet = result[j]
                subSet.append(num)
                result.append(subSet)
            }
        }
        return result
    }
}
