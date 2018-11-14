import Cocoa

var s = [9, 9, 9]

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var result = digits
        var indexs = [Int]()
        for (index, value) in digits.enumerated().reversed() {
            indexs.append(index)
            if value < 9 {
                break
            }
        }
        
        for index in indexs{
            result[index] = (result[index] + 1) % 10
        }
        
        if indexs.last! == 0 && digits.first! == 9{
            result.insert(1, at: 0)
        }
        
        return result
    }
}

Solution().plusOne(s)
