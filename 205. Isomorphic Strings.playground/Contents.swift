import Cocoa


let s = "egg"
let t = "bar"

class Solution {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        return stringToNums(s) == stringToNums(t)
    }
    
    func stringToNums(_ s:String) -> [Int]{
        var dic = [Character:Int]()
        var num = 0
        return s.map { (c) -> Int in
            if let num = dic[c] {
                return num
            } else {
                num += 1
                dic[c] = num
                return num
            }
        }
    }
}

Solution().isIsomorphic(s, t)
