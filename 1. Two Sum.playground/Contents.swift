import Cocoa

let nums = [2, 7, 11, 15]

class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var aNums = [Int:Int]()
        var result = [Int]()
        
        for (index, num) in nums.enumerated(){
            let other = target - num
            if let otherIndex = aNums[other], otherIndex != index{
                result = [index, otherIndex]
                break
            }
            aNums[num] = index
        }
        return result
    }
}

Solution().twoSum(nums, 9)
