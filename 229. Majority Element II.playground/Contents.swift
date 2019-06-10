import Cocoa

/*
 Given an integer array of size n, find all elements that appear more than ⌊ n/3 ⌋ times.
 
 Note: The algorithm should run in linear time and in O(1) space.
 
 Example 1:
 
 Input: [3,2,3]
 Output: [3]
 Example 2:
 
 Input: [1,1,1,3,3,2,2,2]
 Output: [1,2]
*/

class Solution {
    func majorityElement(_ nums: [Int]) -> [Int] {
        guard !nums.isEmpty else {
            return []
        }
        var first = (0, 0)
        var second = (0, 1)
        for n in nums {
            if n == first.1 {
                first.0 += 1
            } else if n == second.1 {
                second.0 += 1
            } else if first.0 == 0 {
                first = (1, n)
            } else if second.0 == 0 {
                second = (1, n)
            } else {
                first.0 -= 1
                second.0 -= 1
            }
        }
        first.0 = 0
        second.0 = 0
        for n in nums {
            if n == first.1 {
                first.0 += 1
            } else if n == second.1 {
                second.0 += 1
            }
        }
        let result = [first, second].filter { $0.0 > nums.count / 3 }.map{ $0.1 }
        return result
    }
}
