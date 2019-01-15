import Cocoa

let a = "123"
let b = "456"

class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        var resultNum = [Int](repeating: 0, count: num1.count + num2.count)
        for i in (0..<num1.count).reversed() {
            for j in (0..<num2.count).reversed() {
                let temp = Int(String(num1[String.Index(encodedOffset: i)]))! * Int(String(num2[String.Index(encodedOffset: j)]))!
                
                let a = i + j
                let b = i + j + 1
                let sum = temp + resultNum[b]
                
                resultNum[a] += sum / 10
                resultNum[b] = sum % 10
            }
        }
        let result = resultNum.reduce("") { !($0.isEmpty && $1 == 0) ? $0 + "\($1)" : $0 }
        return result.isEmpty ? "0" : result
    }
}

Solution().multiply(a, b)
