import Cocoa


let s = [2,1,1,2,4]
class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var set = Set<Int>()
        for num in nums{
            if set.contains(num) {
                set.remove(num)
            } else {
                set.insert(num)
            }
        }
        return set.first!
    }
}

Solution().singleNumber(s)
