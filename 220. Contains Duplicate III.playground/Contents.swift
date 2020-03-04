import Cocoa

/*
 给定一个整数数组，判断数组中是否有两个不同的索引 i 和 j，使得 nums [i] 和 nums [j] 的差的绝对值最大为 t，并且 i 和 j 之间的差的绝对值最大为 ķ。

 示例 1:

 输入: nums = [1,2,3,1], k = 3, t = 0
 输出: true
 示例 2:

 输入: nums = [1,0,1,1], k = 1, t = 2
 输出: true
 示例 3:

 输入: nums = [1,5,9,1,5,9], k = 2, t = 3
 输出: false
 */

class Solution {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        if t < 0 {
            return false
        }
        
        var map = [Int:Int]()
        // key | value
        // -1  | [-(t + 1)...-1]
        // 0   | [0...t]
        // 1   | [(t + 1)...(2t + 1)]
        func getKey(for num:Int) -> Int {
            return num >= 0 ? num / (t + 1) : (num + 1) / (t + 1) - 1
        }
        
        for (index, num) in nums.enumerated() {
            if index > k {
                map.removeValue(forKey: getKey(for: nums[index - k - 1]))
            }
            
            let key = getKey(for: num)
            
            if map.keys.contains(key) {
                return true
            }
            
            if let value = map[key - 1], abs(num - value) <= t {
                return true
            }
            
            if let value = map[key + 1], abs(num - value) <= t {
                return true
            }
            
            map[key] = num
        }
        
        return false
    }
}
