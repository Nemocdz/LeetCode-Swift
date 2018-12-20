import Cocoa

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var result = 0
        var leftIndex = 0
        var map = [Character: Int]()
        for (index, c) in s.enumerated() {
            if let lastIndex = map[c],lastIndex >= leftIndex {
                result = max(result, index - leftIndex)
                leftIndex = lastIndex + 1
            }
            map[c] = index
        }
        return max(result, s.count - leftIndex)
    }
}

