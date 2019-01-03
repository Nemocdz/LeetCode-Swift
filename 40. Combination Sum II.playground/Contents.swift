import Cocoa

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


