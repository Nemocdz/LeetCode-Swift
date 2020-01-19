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
        // f(n,k) = n_list[k/(n-1)!] + f(n-1,k%(n-1)!)
        var factorial = (1...n + 1).map { $0 }
        for index in 1..<n {
            factorial[index] = factorial[index - 1] * index
        }
        var nList = (1..<n + 1).map{ $0 }
        func _getPermutation(n:Int, k:Int) -> String {
            return n == 1 ? "\(nList.first!)" : "\(nList.remove(at: k / factorial[n - 1]))" + _getPermutation(n: n - 1, k: k % factorial[n - 1])
        }
        // k 转为 index
        return _getPermutation(n: n, k: k - 1)
    }
}

Solution().getPermutation(4, 9)
