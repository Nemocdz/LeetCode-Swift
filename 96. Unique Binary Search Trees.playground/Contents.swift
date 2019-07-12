import Cocoa

/*
 给定一个整数 n，求以 1 ... n 为节点组成的二叉搜索树有多少种？
 
 示例:
 
 输入: 3
 输出: 5
 解释:
 给定 n = 3, 一共有 5 种不同结构的二叉搜索树:
 
 1         3     3      2      1
  \       /     /      / \      \
   3     2     1      1   3      2
  /     /       \                 \
 2     1         2                 3
 
*/

class Solution {
    func numTrees(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        var results = [Int]()
        return numTrees(n, &results)
    }

    func numTrees(_ n: Int, _ results: inout [Int]) -> Int {
        if n < results.count {
            return results[n]
        }
        if n == 0 {
            results.append(1)
            return 1
        }
        
        var result = 0
        for num in 0..<n {
            result += numTrees(num, &results) * numTrees(n - num - 1, &results)
        }
        
        results.append(result)
        return result
    }
}

Solution().numTrees(3)
