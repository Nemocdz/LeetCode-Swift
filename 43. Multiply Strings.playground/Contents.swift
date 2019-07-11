import Cocoa

/*
 给定两个以字符串形式表示的非负整数 num1 和 num2，返回 num1 和 num2 的乘积，它们的乘积也表示为字符串形式。
 
 示例 1:
 
 输入: num1 = "2", num2 = "3"
 输出: "6"
 示例 2:
 
 输入: num1 = "123", num2 = "456"
 输出: "56088"
 说明：
 
 num1 和 num2 的长度小于110。
 num1 和 num2 只包含数字 0-9。
 num1 和 num2 均不以零开头，除非是数字 0 本身。
 不能使用任何标准库的大数类型（比如 BigInteger）或直接将输入转换为整数来处理。
*/

let a = "123"
let b = "456"

class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        var resultNum = [Int](repeating: 0, count: num1.count + num2.count)
        for i in (0..<num1.count).reversed() {
            for j in (0..<num2.count).reversed() {
                let temp = Int(String(num1[String.Index(encodedOffset: i)]))! * Int(String(num2[String.Index(encodedOffset: j)]))!
                
                let a = i + j
                let b = i + j + 1
                let sum = temp + resultNum[b]
                
                resultNum[a] += sum / 10
                resultNum[b] = sum % 10
            }
        }
        let result = resultNum.reduce("") { !($0.isEmpty && $1 == 0) ? $0 + "\($1)" : $0 }
        return result.isEmpty ? "0" : result
    }
}

Solution().multiply(a, b)
