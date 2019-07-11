import Cocoa

/*
 实现获取下一个排列的函数，算法需要将给定数字序列重新排列成字典序中下一个更大的排列。
 
 如果不存在下一个更大的排列，则将数字重新排列成最小的排列（即升序排列）。
 
 必须原地修改，只允许使用额外常数空间。
 
 以下是一些例子，输入位于左侧列，其相应输出位于右侧列。
 1,2,3 → 1,3,2
 3,2,1 → 1,2,3
 1,1,5 → 1,5,1
*/

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
