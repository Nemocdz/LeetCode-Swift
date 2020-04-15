import Cocoa

/*
 给定一个整数数组  nums，求出数组从索引 i 到 j  (i ≤ j) 范围内元素的总和，包含 i,  j 两点。

 update(i, val) 函数可以通过将下标为 i 的数值更新为 val，从而对数列进行修改。

 示例:

 Given nums = [1, 3, 5]

 sumRange(0, 2) -> 9
 update(1, 2)
 sumRange(0, 2) -> 8
 说明:

 数组仅可以在 update 函数下进行修改。
 你可以假设 update 函数与 sumRange 函数的调用次数是均匀分布的。
*/

class SegmentTree<T> {
    var value:T
    let transform:(T, T) -> T
    let range:(Int, Int)
    var left: SegmentTree<T>?
    var right: SegmentTree<T>?
    
    init?(array: [T], range:(Int, Int), transform: @escaping (T, T) -> T) {
        if array.isEmpty {
            return nil
        }

        self.range = range
        self.transform = transform
                
        if range.0 == range.1 {
            value = array[range.0]
        } else {
            let mid = (range.0 + range.1) / 2
            
            left = SegmentTree(array: array, range: (range.0, mid), transform: transform)
            right = SegmentTree(array: array, range: (mid + 1, range.1), transform: transform)
            
            value = transform(left!.value, right!.value)
        }
    }
    
    func query(range:(Int, Int)) -> T {
        if range.0 == self.range.0 && range.1 == self.range.1 {
            return value
        }
        
        guard let left = left else { fatalError() }
        guard let right = right else { fatalError() }
        
        if left.range.1 < range.0 {
            return right.query(range: range)
        } else if right.range.0 > range.1 {
            return left.query(range: range)
        } else {
            let leftResult = left.query(range: (range.0, left.range.1))
            let rightResult = right.query(range: (right.range.0, range.1))
            return transform(leftResult, rightResult)
        }
    }
    
    func update(value:T, at index:Int) {
        if range.0 == range.1 {
            self.value = value
        } else if let left = left, let right = right {
            if left.range.1 >= index {
                left.update(value: value, at: index)
            } else {
                right.update(value: value, at: index)
            }
            self.value = transform(left.value, right.value)
        }
    }
}

class NumArray {
    let tree:SegmentTree<Int>?
    init(_ nums: [Int]) {
        tree = SegmentTree(array: nums, range: (0, nums.count - 1), transform: +)
    }
    
    func update(_ i: Int, _ val: Int) {
        tree?.update(value: val, at: i)
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        return tree?.query(range: (i, j)) ?? -1
    }
}
