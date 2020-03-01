import Cocoa

/*
 找出所有相加之和为 n 的 k 个数的组合。组合中只允许含有 1 - 9 的正整数，并且每种组合中不存在重复的数字。
 
 说明：
 
 所有数字都是正整数。
 解集不能包含重复的组合。
 示例 1:
 
 输入: k = 3, n = 7
 输出: [[1,2,4]]
 示例 2:
 
 输入: k = 3, n = 9
 输出: [[1,2,6], [1,3,5], [2,3,4]]
 */

class Solution {
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        if k > 9 || k == 0 {
            return []
        }
        
        var answers = [[Int]]()
        var temp = [Int]()
                
        func _kSum(_ nums:[Int], target:Int, k:Int) {
            if k == 0 && target == 0 {
                answers.append(temp)
            } else if k > 0 && target > 0 {
                for (index, num) in nums.enumerated() {
                    if index + k - 1 >= nums.count {
                        continue
                    }
                    temp.append(num)
                    _kSum(Array(nums[(index + 1)...]), target: target - num, k: k - 1)
                    temp.removeLast()
                }
            }
        }

        _kSum((1...9).map{ $0 }, target: n, k: k)

        return answers
    }
}
