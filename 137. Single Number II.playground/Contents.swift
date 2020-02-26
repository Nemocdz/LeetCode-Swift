import Cocoa

/*
 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现了三次。找出那个只出现了一次的元素。

 说明：

 你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？

 示例 1:

 输入: [2,2,3,2]
 输出: 3
 示例 2:

 输入: [0,1,0,1,0,1,99]
 输出: 99
 */

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var map = [Int:Int]()
        for num in nums {
            let count = map[num] ?? 0
            if count == 0 {
                map[num] = 1
            } else if count == 1 {
                map[num] = 2
            } else if count == 2 {
                map.removeValue(forKey: num)
            }
        }
        return map.first?.key ?? -1
    }
}
