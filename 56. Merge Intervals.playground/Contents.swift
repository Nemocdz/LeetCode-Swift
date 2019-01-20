import Cocoa

/**
 * Definition for an interval.
 */
public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}
 
class Solution {
    func merge(_ intervals: [Interval]) -> [Interval] {
        guard !intervals.isEmpty else {
            return []
        }
        var intervals = intervals
        intervals.sort { $0.start < $1.start ? true : ($0.start == $1.start ? $0.end < $1.end : false) }
        

        var result = [Interval]()
        var lastInterval = intervals.first!
        for interval in intervals.dropFirst(){
            if interval.start <= lastInterval.end {
                lastInterval = Interval(lastInterval.start, max(interval.end, lastInterval.end))
            } else {
                result.append(lastInterval)
                lastInterval = interval
            }
        }
        
        result.append(lastInterval)
        
        return result
    }
}
