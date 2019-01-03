import Cocoa

var a = [1, 3, 2]

class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        guard nums.count > 1 else {
            return
        }
        
        var flagIndex = nums.count - 2
        for (index, num) in nums.enumerated().reversed(){
            guard index > 0 else {
                flagIndex = -1
                break
            }
            flagIndex = index - 1
            if num > nums[flagIndex]{
                break
            }
        }
        
        if flagIndex == -1 {
            nums = nums.reversed()
        } else {
            var swapIndex = flagIndex + 1
            for (index, num) in nums.enumerated().reversed(){
                if num > nums[flagIndex] {
                    swapIndex = index
                    break
                }
            }
            nums.swapAt(swapIndex, flagIndex)
            var array = nums[flagIndex + 1..<nums.count]
            array.sort()
            nums.replaceSubrange(flagIndex + 1..<nums.count, with: array)
        }
    }
}

Solution().nextPermutation(&a)
