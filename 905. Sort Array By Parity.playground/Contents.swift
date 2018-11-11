import Cocoa

let s = [3,1,2,4]

class Solution {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        let odd = A.filter { (num) -> Bool in
            return (num % 2 == 1)
        }
        let even = A.filter { (num) -> Bool in
            return (num % 2 == 0)
        }
        return even + odd
    }
}

Solution().sortArrayByParity(s)
