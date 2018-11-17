import Cocoa

var nums1 = [1, 2, 3, 0, 0, 0]
let nums2 = [2, 5, 6]

let m = 3
let n = 3

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        for index in 0..<n {
            nums1[m + index] = nums2[index]
        }
        nums1.sort()
        
    }
}

Solution().merge(&nums1, 3, nums2, 3)

