import Cocoa

/*
 给出集合 [1,2,3,…,n]，其所有元素共有 n! 种排列。
 
 按大小顺序列出所有排列情况，并一一标记，当 n = 3 时, 所有排列如下：
 
 "123"
 "132"
 "213"
 "231"
 "312"
 "321"
 给定 n 和 k，返回第 k 个排列。
 
 说明：
 
 给定 n 的范围是 [1, 9]。
 给定 k 的范围是[1,  n!]。
 示例 1:
 
 输入: n = 3, k = 3
 输出: "213"
 示例 2:
 
 输入: n = 4, k = 9
 输出: "2314"
*/

class Solution {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var factorial = [1]
        var sum = 1
        for index in 1..<n + 1{
            sum *= index
            factorial.append(sum)
        }
        
        var nums = (1..<n + 1).map{ $0 }
        
        var k = k - 1
        var result = ""
        for index in 1..<n + 1 {
            let a = k / factorial[n - index]
            result += "\(nums[a])"
            nums.remove(at: a)
            k -= a * factorial[n - index]
        }
        
        return result
        
    }
}
