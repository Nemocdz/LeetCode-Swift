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
        if nums.count <= 1 {
            return
        }
                
        var i = nums.count - 2
        // 找到倒数第一个逆序点
        while i >= 0 && nums[i] >= nums[i + 1] {
            i -= 1
        }
        
        // 如果不是全部逆序
        if i >= 0 {
            var j = nums.count - 1
            // 找到点右边倒数第一个比 nums[i] 大的
            while nums[j] <= nums[i] {
                j -= 1
            }
            nums.swapAt(i, j)
        }
        
        // 后面的直接反转，就是最小的排列
        nums[(i + 1)...].reverse()
    }
}

Solution().nextPermutation(&a)
