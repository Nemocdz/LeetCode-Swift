import Cocoa

/*
 给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。
 
 示例 1:
 
 输入: [1,2,3,4,5,6,7] 和 k = 3
 输出: [5,6,7,1,2,3,4]
 解释:
 向右旋转 1 步: [7,1,2,3,4,5,6]
 向右旋转 2 步: [6,7,1,2,3,4,5]
 向右旋转 3 步: [5,6,7,1,2,3,4]
 示例 2:
 
 输入: [-1,-100,3,99] 和 k = 2
 输出: [3,99,-1,-100]
 解释:
 向右旋转 1 步: [99,-1,-100,3]
 向右旋转 2 步: [3,99,-1,-100]
 说明:
 
 尽可能想出更多的解决方案，至少有三种不同的方法可以解决这个问题。
 要求使用空间复杂度为 O(1) 的 原地 算法。
*/

var nums = [1, 2, 3, 4, 5, 6, 7]
let k = 8

class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let k = k % nums.count
        
        func reverse(_ start:Int, _ end:Int) {
            var start = start
            var end = end
            while start < end {
                nums.swapAt(start, end)
                start += 1
                end -= 1
            }
        }
        
        reverse(0, nums.count - k - 1)
        reverse(nums.count - k, nums.count - 1)
        reverse(0, nums.count - 1)
    }
}

Solution().rotate(&nums, k)
