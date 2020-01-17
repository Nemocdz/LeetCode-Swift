import Cocoa

/*
 给出一个区间的集合，请合并所有重叠的区间。
 
 示例 1:
 
 输入: [[1,3],[2,6],[8,10],[15,18]]
 输出: [[1,6],[8,10],[15,18]]
 解释: 区间 [1,3] 和 [2,6] 重叠, 将它们合并为 [1,6].
 示例 2:
 
 输入: [[1,4],[4,5]]
 输出: [[1,5]]
 解释: 区间 [1,4] 和 [4,5] 可被视为重叠区间。
*/

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
        if intervals.isEmpty {
            return []
        }
        
        let intervals = intervals.sorted {
            if $0.start < $1.start {
                return true
            } else if $0.start > $0.start {
                return false
            } else {
                return $0.end < $1.end
            }
        }
    
        var answers = [Interval]()
        var lastInterval = intervals.first!
        for interval in intervals.dropFirst() {
            if interval.start <= lastInterval.end {
                lastInterval = Interval(lastInterval.start, max(interval.end, lastInterval.end))
            } else {
                answers.append(lastInterval)
                lastInterval = interval
            }
        }
        answers.append(lastInterval)
        return answers
    }
}
