import UIKit

let J = "aA"
let S = "aAAbbbb"

class Solution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        return S.filter { (stone) -> Bool in
            return J.contains(stone)
            }.count
    }
}

Solution().numJewelsInStones(J, S)
