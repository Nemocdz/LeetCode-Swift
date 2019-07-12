import Cocoa

/*
 给定两个二进制字符串，返回他们的和（用二进制表示）。
 
 输入为非空字符串且只包含数字 1 和 0。
 
 示例 1:
 
 输入: a = "11", b = "1"
 输出: "100"
 示例 2:
 
 输入: a = "1010", b = "1011"
 输出: "10101"
*/

let a = "10100000100100110110010000010101111011011001101110111111111101000000101111001110001111100001101"
let b = "110101001011101110001111100110001010100001101011101010000011011011001011101111001100000011011110011"

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var result = ""
        var index1 = a.count - 1
        var index2 = b.count - 1
        var carry = 0
        
        while index1 >= 0 || index2 >= 0 || carry > 0 {
            let s1 = index1 >= 0 ? Int(String(a[String.Index.init(encodedOffset: index1)]))! : 0
            let s2 = index2 >= 0 ? Int(String(b[String.Index.init(encodedOffset: index2)]))! : 0
            let sum = s1 + s2 + carry
            carry = sum >= 2 ? 1 : 0
            
            result = "\(sum % 2)" + result
            
            index1 -= 1
            index2 -= 1
        }
        
        return result
    }
}

Solution().addBinary(a, b)
