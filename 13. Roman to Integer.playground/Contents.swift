import Cocoa

let s = "MCMXCIV"

struct Rule{
    let pre:Character
    let value:Int
}

class Solution {
    func romanToInt(_ s: String) -> Int {
        let romanNums:[Character:Int] = ["I":1, "V":5, "X":10, "L":50, "C":100, "D": 500, "M":1000]
        let rules:[Character:Rule] = ["V":Rule(pre: "I", value: 4),
                                      "X":Rule(pre: "I", value: 9),
                                      "L":Rule(pre: "X", value: 40),
                                      "C":Rule(pre: "X", value: 90),
                                      "D":Rule(pre: "C", value: 400),
                                      "M":Rule(pre: "C", value: 900)]
        var temp = s.first
        var result = 0
        for c in s{
            var value = romanNums[c] ?? 0
            if let rule = rules[c], rule.pre == temp{
                let preValue = romanNums[rule.pre] ?? 0
                value = rule.value - preValue
            }
            
            result += value
            temp = c
        }
        return result
    }
}

Solution().romanToInt(s)
