import Cocoa

let s = "23"

class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        let map:[Character: [String]] = ["0":[""],
                                         "1":[""],
                                         "2":["a","b","c"],
                                         "3":["d","e","f"],
                                         "4":["g","h","i"],
                                         "5":["j","k","l"],
                                         "6":["m","n","o"],
                                         "7":["p","q","r","s"],
                                         "8":["t","u","v"],
                                         "9":["w","x","y","z"]]
        var result = [String]()
        digits.forEach {
            guard let strings = map[$0] else { return }
            if result.isEmpty {
                result = strings
            } else {
                result = result.flatMap({ string in strings.map({ string + $0 }) })
            }
        }
        return result
    }
}

Solution().letterCombinations(s)
