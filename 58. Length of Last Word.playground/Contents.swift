import Cocoa

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        guard let last = s.split(separator: " ").last else {
            return 0
        }
        return last.count
    }
}
