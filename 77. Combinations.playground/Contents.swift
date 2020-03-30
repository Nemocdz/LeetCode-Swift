import Cocoa

/*
 给定两个整数 n 和 k，返回 1 ... n 中所有可能的 k 个数的组合。

 示例:

 输入: n = 4, k = 2
 输出:
 [
   [2,4],
   [3,4],
   [2,3],
   [1,2],
   [1,3],
   [1,4],
 ]
 */

class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var answers = [[Int]]()
        var temp = [Int]()
        
        func _combine(_ nums:[Int]) {
            if temp.count == k {
                answers.append(temp)
            } else {
                // k 个已经有了 temp.count 个，所以最后提前结束
                for i in 0..<(nums.count - (k - temp.count) + 1) {
                    temp.append(nums[i])
                    _combine(Array(nums[(i + 1)...]))
                    temp.removeLast()
                }
            }
        }
        
        _combine((1...n).map{ $0 })
        return answers
    }
}
