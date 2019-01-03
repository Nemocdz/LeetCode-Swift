import Cocoa

let s = "A man, a plan, a canal: Panama"

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let string = s.lowercased().filter({ CharacterSet.alphanumerics.contains($0.unicodeScalars.first!) })
        return string == String(string.reversed())
    }
}

Solution().isPalindrome(s)
