import Cocoa

/*
 Find all possible combinations of k numbers that add up to a number n, given that only numbers from 1 to 9 can be used and each combination should be a unique set of numbers.
 
 Note:
 
 All numbers will be positive integers.
 The solution set must not contain duplicate combinations.
 Example 1:
 
 Input: k = 3, n = 7
 Output: [[1,2,4]]
 Example 2:
 
 Input: k = 3, n = 9
 Output: [[1,2,6], [1,3,5], [2,3,4]]
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
