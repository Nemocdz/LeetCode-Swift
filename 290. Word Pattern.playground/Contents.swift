import Cocoa

let p = "abba"
let s = "dog cat cat dog"

class Solution {
    func wordPattern(_ pattern: String, _ str: String) -> Bool {
        let words = str.split(separator: " ").map({String($0)})
        let chars = pattern.map({$0})
        
        guard words.count == chars.count else {
            return false
        }
        
        var result = true
        var map = [Character: String]()
        for index in 0..<words.count {
            if map.keys.contains(chars[index]){
                if map[chars[index]] != words[index] {
                    result = false
                    break
                }
            } else {
                if map.values.contains(words[index]) {
                    result = false
                    break
                } else {
                    map[chars[index]] = words[index]
                }
            }
        }
        return result
    }
}

Solution().wordPattern(p, s)
