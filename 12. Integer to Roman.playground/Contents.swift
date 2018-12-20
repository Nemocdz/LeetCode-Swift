import Cocoa


let p = 1994

class Solution {
    func intToRoman(_ num: Int) -> String {
        let m = ["","M","MM","MMM"]
        let c = ["","C","CC","CCC","CD","D","DC","DCC","DCCC","CM"]
        let x = ["","X","XX","XXX","XL","L","LX","LXX","LXXX","XC"]
        let i = ["","I","II","III","IV","V","VI","VII","VIII","IX"]
        return m[num / 1000] + c[(num % 1000) / 100] + x[(num % 100) / 10] + i[num % 10]
    }
}

Solution().intToRoman(p)
