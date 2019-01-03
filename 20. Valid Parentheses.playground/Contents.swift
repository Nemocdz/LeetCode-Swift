import Cocoa

class Solution {
    func isValid(_ s: String) -> Bool {
        let pair:[Character:Character] = [")":"(","}":"{","]":"["]
        var stack = [Character]()
        var result = true
        for c in s {
            if pair.keys.contains(c){
                guard !stack.isEmpty else {
                    result = false
                    break
                }
                
                let top = stack.removeLast()
                if pair[c] != top {
                    result = false
                    break
                }
            } else {
                stack.append(c)
            }
        }
        
        return stack.isEmpty ? result : false
    }
}


