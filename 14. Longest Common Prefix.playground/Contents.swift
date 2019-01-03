import Cocoa

let a = ["flower","flow","flight"]

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard !strs.isEmpty else  {
            return ""
        }
        var result = strs.first!
        for str in strs.dropFirst(){
            while str.range(of: result)?.lowerBound.encodedOffset != 0 {
                result = String(result.dropLast())
                if result.isEmpty {
                    return result
                }
            }
        }
        return result
    }
}

Solution().longestCommonPrefix(a)
