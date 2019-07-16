import Cocoa

/*
 找出所有相加之和为 n 的 k 个数的组合。组合中只允许含有 1 - 9 的正整数，并且每种组合中不存在重复的数字。
 
 说明：
 
 所有数字都是正整数。
 解集不能包含重复的组合。
 示例 1:
 
 输入: k = 3, n = 7
 输出: [[1,2,4]]
 示例 2:
 
 输入: k = 3, n = 9
 输出: [[1,2,6], [1,3,5], [2,3,4]]
 */

class Solution {
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        func combination(_ result:inout [[Int]], _ array:inout [Int],_ k:Int,_ start:Int,_ n:Int){
            if array.count == k && n == 0 {
                result.append(array)
            } else {
                for i in start..<10 {
                    array.append(i)
                    combination(&result, &array, k, i + 1, n - i)
                    array.removeLast()
                }
            }
        }
        var result = [[Int]]()
        var array = [Int]()
        combination(&result, &array, k, 1, n)
        return result
    }
}
