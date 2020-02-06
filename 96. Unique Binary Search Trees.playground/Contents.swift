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
        
        var cache = [0:1]
        
        func _numTrees(_ n:Int) -> Int {
            if let num = cache[n] {
                return num
            }
            
            var answer = 0
            for num in 1...n {
                let small = num - 1
                let big = n - num
                answer += _numTrees(small) * _numTrees(big)
            }
            
            cache[n] = answer
            return answer
        }
        
        return _numTrees(n)
    }
}

Solution().numTrees(3)
