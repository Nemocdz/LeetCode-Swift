import Cocoa
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
