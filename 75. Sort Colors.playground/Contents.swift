import Cocoa

/*
 给定一个包含红色、白色和蓝色，一共 n 个元素的数组，原地对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。
 
 此题中，我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。
 
 注意:
 不能使用代码库中的排序函数来解决这道题。
 
 示例:
 
 输入: [2,0,2,1,1,0]
 输出: [0,0,1,1,2,2]
 进阶：
 
 一个直观的解决方案是使用计数排序的两趟扫描算法。
 首先，迭代计算出0、1 和 2 元素的个数，然后按照0、1、2的排序，重写当前数组。
 你能想出一个仅使用常数空间的一趟扫描算法吗？
*/

var a = [1,2,0]
class Solution {
    func sortColors(_ nums: inout [Int]) {
        var first = 0
        var last = nums.count - 1
        for index in 0..<nums.count {
            let num = nums[index]
            func reduceZero(){
                while first < last {
                    if nums[first] != 0 {
                        break
                    }
                    first += 1
                }
                if index > first {
                    nums.swapAt(index, first)
                    first += 1
                } else if index == first {
                    first += 1
                }
            }
            
            if num == 0 {
                reduceZero()
            } else if num == 2 {
                while first < last {
                    if nums[last] != 2 {
                        break
                    }
                    last -= 1
                }
                if index < last {
                    nums.swapAt(index, last)
                    last -= 1
                    if nums[index] == 0 {
                        reduceZero()
                    }
                } else if index == last {
                    last -= 1
                }
            }
        }
    }
}

Solution().sortColors(&a)
