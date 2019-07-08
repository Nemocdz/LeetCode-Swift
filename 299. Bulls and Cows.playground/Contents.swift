import Cocoa

/*
 You are playing the following Bulls and Cows game with your friend: You write down a number and ask your friend to guess what the number is. Each time your friend makes a guess, you provide a hint that indicates how many digits in said guess match your secret number exactly in both digit and position (called "bulls") and how many digits match the secret number but locate in the wrong position (called "cows"). Your friend will use successive guesses and hints to eventually derive the secret number.
 
 Write a function to return a hint according to the secret number and friend's guess, use A to indicate the bulls and B to indicate the cows.
 
 Please note that both secret number and friend's guess may contain duplicate digits.
 
 Example 1:
 
 Input: secret = "1807", guess = "7810"
 
 Output: "1A3B"
 
 Explanation: 1 bull and 3 cows. The bull is 8, the cows are 0, 1 and 7.
 Example 2:
 
 Input: secret = "1123", guess = "0111"
 
 Output: "1A1B"
 
 Explanation: The 1st 1 in friend's guess is a bull, the 2nd or 3rd 1 is a cow.
*/

class Solution {
    func getHint(_ secret: String, _ guess: String) -> String {
        var kv = [Character:Int]()
        
        for c in secret {
            if let count = kv[c] {
                kv[c] = count + 1
            } else {
                kv[c] = 1
            }
        }
        
        var bull = 0
        var cow = 0
        
        for (secretC, guessC) in zip(secret, guess) {
            if secretC == guessC {
                bull += 1
                kv[secretC] = kv[secretC]! - 1
            }
        }
        
        for (secretC, guessC) in zip(secret, guess) {
            if secretC != guessC, let count = kv[guessC], count > 0 {
                cow += 1
                kv[guessC] = count - 1
            }
        }
        
        return "\(bull)A\(cow)B"
    }
}

Solution().getHint("1122", "2211")
