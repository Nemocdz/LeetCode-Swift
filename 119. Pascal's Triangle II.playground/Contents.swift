import Cocoa

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
