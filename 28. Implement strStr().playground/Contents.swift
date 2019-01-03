import Cocoa

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.isEmpty {
            return 0
        }
        guard !needle.isEmpty && haystack.count >= needle.count else {
            return -1
        }
        var result = -1
        for index in 0..<haystack.count - needle.count + 1 {
            guard haystack[String.Index(encodedOffset: index)] == needle.first else {
                continue
            }
            if haystack[String.Index(encodedOffset: index)..<String.Index(encodedOffset: index + needle.count)] == needle {
                result = index
                break
            }
        }
        return result
    }
}
