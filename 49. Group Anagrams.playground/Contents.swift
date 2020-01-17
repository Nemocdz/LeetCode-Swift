import Cocoa

/*
 给定一个字符串数组，将字母异位词组合在一起。字母异位词指字母相同，但排列不同的字符串。
 
 示例:
 
 输入: ["eat", "tea", "tan", "ate", "nat", "bat"],
 输出:
 [
 ["ate","eat","tea"],
 ["nat","tan"],
 ["bat"]
 ]
*/

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var dic = [[Character]:[String]]()
        for s in strs {
            let key = s.sorted()
            if var group = dic[key] {
                group.append(s)
                dic[key] = group
            } else {
                dic[key] = [s]
            }
        }
        return [[String]](dic.values)
    }
}


