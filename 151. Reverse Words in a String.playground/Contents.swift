import Cocoa

/*
Given an input string, reverse the string word by word.



Example 1:

Input: "the sky is blue"
Output: "blue is sky the"
Example 2:

Input: "  hello world!  "
Output: "world! hello"
Explanation: Your reversed string should not contain leading or trailing spaces.
Example 3:

Input: "a good   example"
Output: "example good a"
Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.
*/

class Solution {
    func reverseWords(_ s: String) -> String {
        var words = s.split(separator: " ").map{ String($0) }
        words.reverse()
        if words.isEmpty {
            return ""
        } else {
            return words.dropFirst().reduce(words.first!) { $0 + " " + $1 }
        }
    }
}

