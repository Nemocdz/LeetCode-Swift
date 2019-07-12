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
