import Cocoa

/*
 给定一个由整数组成的非空数组所表示的非负整数，在该数的基础上加一。
 
 最高位数字存放在数组的首位， 数组中每个元素只存储一个数字。
 
 你可以假设除了整数 0 之外，这个整数不会以零开头。
 
 示例 1:
 
 输入: [1,2,3]
 输出: [1,2,4]
 解释: 输入数组表示数字 123。
 示例 2:
 
 输入: [4,3,2,1]
 输出: [4,3,2,2]
 解释: 输入数组表示数字 4321。
*/

let s = [9, 9, 9]

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        if digits.isEmpty {
            return []
        }
        var answer = digits
        var flag = false
        for (index, num) in digits.enumerated().reversed() {
            if num >= 9 {
                if !flag {
                    answer[index] = 0
                }
            } else {
                if !flag {
                    answer[index] = num + 1
                }
                flag = true
            }
        }
        
        if answer.first! == 0 {
            answer.insert(1, at: 0)
        }
        
        return answer
    }
}

Solution().plusOne(s)
