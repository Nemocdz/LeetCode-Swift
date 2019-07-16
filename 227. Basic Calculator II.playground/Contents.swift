import Cocoa

/*
 实现一个基本的计算器来计算一个简单的字符串表达式的值。
 
 字符串表达式仅包含非负整数，+， - ，*，/ 四种运算符和空格  。 整数除法仅保留整数部分。
 
 示例 1:
 
 输入: "3+2*2"
 输出: 7
 示例 2:
 
 输入: " 3/2 "
 输出: 1
 示例 3:
 
 输入: " 3+5 / 2 "
 输出: 5
 说明：
 
 你可以假设所给定的表达式都是有效的。
 请不要使用内置的库函数 eval。
*/

class Solution {
    func calculate(_ s: String) -> Int {
        guard !s.isEmpty else {
            return 0
        }
        var stack = [Int]()
        var n = 0
        var op:Character = "+"
        let string = s + "+"
        for c in string {
            guard c != " " else {
                continue
            }
            if let num = Int(String(c)){
                n = n * 10 + num
            } else {
                if op == "+" {
                    stack.append(n)
                } else if op == "-" {
                    stack.append(-n)
                } else if op == "*" {
                    stack.append(stack.removeLast() * n)
                } else if op == "/" {
                    stack.append(stack.removeLast() / n)
                }
                
                op = c
                n = 0
            }
        }
        
        var result = 0
        while !stack.isEmpty {
            result += stack.removeLast()
        }
        return result
    }
}
