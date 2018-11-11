import Cocoa

let words = ["gin", "zen", "gig", "msg"]

class Solution {
    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        let array = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
        return Set<String>(words.map { (word) -> String in
            let aWord = word.uppercased()
            var result = ""
            aWord.unicodeScalars.forEach({ (s) in
                result += array[Int(s.value) - 65]
            })
            return result
        }).count
    }
}

Solution().uniqueMorseRepresentations(words)
