import Cocoa

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
