import Cocoa

/*
 给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。
 
 示例 1:
 
 输入: 123
 输出: 321
   示例 2:
 
 输入: -123
 输出: -321
 示例 3:
 
 输入: 120
 输出: 21
 注意:
 
 假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−231,  231 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。
*/

let x = -90000

class Solution {
    func reverse(_ x: Int) -> Int {
        let max = 1<<31 - 1
        let min = -(max + 1)
        var reverse = 0
        var num = x
        while num != 0 {
            reverse = reverse * 10 + num % 10
            num /= 10
        }
        return reverse > max || reverse < min ? 0 : reverse
    }
}

Solution().reverse(x)

