import Cocoa

let s = [2,7,11,15]
let target = 9

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var result = [Int]()
        var start = 0
        var end = numbers.count - 1
        
        while start < end {
            let sum = numbers[start] + numbers[end]
            if sum < target {
                start += 1
            } else if sum > target {
                end -= 1
            } else {
                result = [start + 1, end + 1]
                break
            }
        }
        
        return result
    }
}


Solution().twoSum(s, target)
