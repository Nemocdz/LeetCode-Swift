import Cocoa

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        guard numRows > 0 else {
            return []
        }
        let first = [1]
        var result = [first]
        
        guard numRows > 1 else {
            return result
        }
        
        var lastNums = first
        for _ in 1...numRows - 1 {
            lastNums = create(lastNums)
            result.append(lastNums)
        }
        return result
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

Solution().generate(5)
