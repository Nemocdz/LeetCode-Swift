import Cocoa

let s = "anagram"
let t = "nagaram"

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }
        
        var map = [Character: Int]()
        var result = true
        s.forEach { (c) in
            if let count = map[c] {
                map[c] = count + 1
            } else {
                map[c] = 1
            }
        }
        
        t.forEach { (c) in
            if let count = map[c], count > 0{
                map[c] = count - 1
            } else {
                result = false
                return
            }
        }
        
        return result
    }
}

Solution().isAnagram(s, t)
