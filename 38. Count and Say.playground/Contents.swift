import Cocoa

/*
 报数序列是一个整数序列，按照其中的整数的顺序进行报数，得到下一个数。其前五项如下：
 
 1.     1
 2.     11
 3.     21
 4.     1211
 5.     111221
 1 被读作  "one 1"  ("一个一") , 即 11。
 11 被读作 "two 1s" ("两个一"）, 即 21。
 21 被读作 "one 2",  "one 1" （"一个二" ,  "一个一") , 即 1211。
 
 给定一个正整数 n（1 ≤ n ≤ 30），输出报数序列的第 n 项。
 
 注意：整数顺序将表示为一个字符串。
*/

class Solution {
    func countAndSay(_ n: Int) -> String {
        if n <= 1 {
            return "1"
        }
        
        let pre = countAndSay(n - 1)
        var answer = ""
        
        var stack = [Character]()
        
        for c in pre {
            if let last = stack.last, last != c {
                answer.append("\(stack.count)\(last)")
                stack.removeAll()
            }
            stack.append(c)
        }
        
        if let last = stack.last {
            answer.append("\(stack.count)\(last)")
        }
        
        return answer
    }
}

Solution().countAndSay(5)
