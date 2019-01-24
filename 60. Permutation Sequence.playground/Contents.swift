import Cocoa

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
