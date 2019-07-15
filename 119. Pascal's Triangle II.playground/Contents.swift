import Cocoa

/*
 给定一个非负索引 k，其中 k ≤ 33，返回杨辉三角的第 k 行。
 
 
 
 在杨辉三角中，每个数是它左上方和右上方的数的和。
 
 示例:
 
 输入: 3
 输出: [1,3,3,1]
 进阶：
 
 你可以优化你的算法到 O(k) 空间复杂度吗？
*/

class Solution {
    
    func getRow(_ rowIndex: Int) -> [Int] {
        let first = [1]
        guard rowIndex > 0 else {
            return first
        }
        var lastNums = first
        for _ in 1...rowIndex {
            lastNums = create(lastNums)
        }
        return lastNums
    }
    
    func create(_ lastNums: [Int]) -> [Int] {
        var result = [1]
        for index in 0..<lastNums.count - 1 {
            result.append(lastNums[index] + lastNums[index + 1])
        }
        result.append(1)
        return result
    }
}

Solution().getRow(3)
