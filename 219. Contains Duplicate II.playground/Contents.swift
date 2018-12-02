import Cocoa

let a = [1, 2, 3, 1]
let k = 3

class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var result = false
        var dic = [Int:Int]()
        for index in 0..<nums.count {
            if let sameIndex = dic[nums[index]], index - sameIndex <= k {
                result = true
                break
            } else {
                dic[nums[index]] = index
            }
        }
        return result
    }
}

Solution().containsNearbyDuplicate(a, k)
