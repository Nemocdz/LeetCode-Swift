import UIKit

let emails = ["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]

class Solution {
    func numUniqueEmails(_ emails: [String]) -> Int {
        
        var resultEmails = Set<String>()
        for email in emails {
            let results = email.components(separatedBy: "@")
            guard results.count == 2 else{
                continue
            }
            
            let address = results[0]
            let domain = results[1]
            
            var name = address
            if let result = address.components(separatedBy: "+").first {
                name = result
            }
            name = name.replacingOccurrences(of: ".", with: "")
            name = name + "@" + domain
            resultEmails.insert(name)
        }
        return resultEmails.count
    }
}

Solution().numUniqueEmails(emails)
