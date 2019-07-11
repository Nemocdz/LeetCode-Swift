import Cocoa

/*
 给定一个数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。
 
 candidates 中的每个数字在每个组合中只能使用一次。
 
 说明：
 
 所有数字（包括目标数）都是正整数。
 解集不能包含重复的组合。
 示例 1:
 
 输入: candidates = [10,1,2,7,6,1,5], target = 8,
 所求解集为:
 [
 [1, 7],
 [1, 2, 5],
 [2, 6],
 [1, 1, 6]
 ]
 示例 2:
 
 输入: candidates = [2,5,2,1,2], target = 5,
 所求解集为:
 [
     [1,2,2],
     [5]
 ]
*/

class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        guard !candidates.isEmpty else {
            return result
        }
        var candidates = candidates
        candidates.sort()
        _combinationSum(&result, [Int](), candidates, target, 0)
        return result
    }
    
    func _combinationSum(_ result:inout [[Int]], _ temp:[Int], _ candidates:[Int], _ remain:Int, _ start:Int) {
        if remain < 0 {
            return
        } else if remain == 0 {
            result.append(temp)
        } else {
            for index in start..<candidates.count {
                let num = candidates[index]
                guard index == start || num != candidates[index - 1] else {
                    continue
                }
                var temp = temp
                temp.append(num)
                _combinationSum(&result, temp, candidates, remain - num, index + 1)
                temp.removeLast()
            }
        }
    }
}


