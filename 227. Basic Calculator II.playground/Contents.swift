import Cocoa

/*
Implement a basic calculator to evaluate a simple expression string.

The expression string contains only non-negative integers, +, -, *, / operators and empty spaces . The integer division should truncate toward zero.

Example 1:

Input: "3+2*2"
Output: 7
Example 2:

Input: " 3/2 "
Output: 1
Example 3:

Input: " 3+5 / 2 "
Output: 5
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
