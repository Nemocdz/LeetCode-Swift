import Cocoa

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dic = [[Character]:[String]]()
        for string in strs {
            let key = string.sorted()
            if var group = dic[key] {
                group.append(string)
                dic[key] = group
            } else {
                dic[key] = [string]
            }
        }
        return dic.map{ _, value in value }
    }
}


