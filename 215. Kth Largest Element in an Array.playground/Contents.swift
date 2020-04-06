import Cocoa

/*
 215. 数组中的第 K 个最大元素
 在未排序的数组中找到第 k 个最大的元素。请注意，你需要找的是数组排序后的第 k 个最大的元素，而不是第 k 个不同的元素。

 示例 1:

 输入: [3,2,1,5,6,4] 和 k = 2
 输出: 5
 示例 2:

 输入: [3,2,3,1,2,4,5,5,6] 和 k = 4
 输出: 4
 说明:

 你可以假设 k 总是有效的，且 1 ≤ k ≤ 数组的长度。
 */

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        var start = 0
        var end = nums.count - 1
        
        func partition(_ start:Int, _ end:Int) -> Int {
            var start = start
            var end = end
            let flag = nums[start]
            
            while start < end {
                while nums[end] <= flag && start < end {
                    end -= 1
                }
                
                if start < end {
                    nums.swapAt(start, end)
                    start += 1
                }
                
                while nums[start] >= flag && start < end {
                    start += 1
                }
                
                if start < end {
                    nums.swapAt(start, end)
                    end -= 1
                }
            }
            
            return start
        }

        while true {
            let index = partition(start, end)
            if index > k - 1 {
                end -= 1
            } else if index < k - 1 {
                start += 1
            } else {
                break
            }
        }
        
        return nums[k - 1]
    }
}
