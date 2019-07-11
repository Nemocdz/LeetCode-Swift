import Cocoa

/*
 给定一个无重复元素的数组 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。
 
 candidates 中的数字可以无限制重复被选取。
 
 说明：
 
 所有数字（包括 target）都是正整数。
 解集不能包含重复的组合。
 示例 1:
 
 输入: candidates = [2,3,6,7], target = 7,
 所求解集为:
 [
 [7],
 [2,2,3]
 ]
 示例 2:
 
 输入: candidates = [2,3,5], target = 8,
 所求解集为:
 [
     [2,2,2,2],
     [2,3,3],
     [3,5]
 ]
*/

class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        guard !candidates.isEmpty else {
            return result
        }
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
                var temp = temp
                let num = candidates[index]
                temp.append(num)
                _combinationSum(&result, temp, candidates, remain - num, index)
                temp.removeLast()
            }
        }
    }
}
