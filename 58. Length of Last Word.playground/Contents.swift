import Cocoa

/*
 给定一个仅包含大小写字母和空格 ' ' 的字符串，返回其最后一个单词的长度。
 
 如果不存在最后一个单词，请返回 0 。
 
 说明：一个单词是指由字母组成，但不包含任何空格的字符串。
 
 示例:
 
 输入: "Hello World"
 输出: 5
*/

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var start:Int? = nil
        var end:Int? = nil
        for (index, c) in s.enumerated().reversed() {
            if c != " " && end == nil {
                end = index
            }
            
            if c == " " && end != nil {
                start = index
                break
            }
        }
        
        if let end = end {
            return end - (start ?? -1)
        } else {
            return 0
        }
    }
}

Solution().lengthOfLastWord(" ")
