import Cocoa
/*
 实现一个二叉搜索树迭代器。你将使用二叉搜索树的根节点初始化迭代器。
 
 调用 next() 将返回二叉搜索树中的下一个最小的数。
 
   
 
 示例：
 
 
 
 BSTIterator iterator = new BSTIterator(root);
 iterator.next();    // 返回 3
 iterator.next();    // 返回 7
 iterator.hasNext(); // 返回 true
 iterator.next();    // 返回 9
 iterator.hasNext(); // 返回 true
 iterator.next();    // 返回 15
 iterator.hasNext(); // 返回 true
 iterator.next();    // 返回 20
 iterator.hasNext(); // 返回 false
   
 
 提示：
 
 next() 和 hasNext() 操作的时间复杂度是 O(1)，并使用 O(h) 内存，其中 h 是树的高度。
 你可以假设 next() 调用总是有效的，也就是说，当调用 next() 时，BST 中至少存在一个下一个最小的数。
*/


/**
 * Definition for a binary tree node.
 */

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}


class BSTIterator {
    struct Stack<Element> {
        var array: [Element] = []
        mutating func push(_ element: Element) {
            array.append(element)
        }
        
        mutating func pop() -> Element? {
            return array.popLast()
        }
        
        var isEmpty: Bool {
            return array.isEmpty
        }
    }
    
    var stack = Stack<TreeNode>()
    
    init(_ root: TreeNode?) {
        pushAll(root)
    }
    
    func pushAll(_ root:TreeNode?) {
        var node = root
        while let aNode = node {
            stack.push(aNode)
            node = aNode.left
        }
    }
    
    /** @return the next smallest number */
    func next() -> Int {
        let tmp = stack.pop()!
        pushAll(tmp.right)
        return tmp.val
    }
    
    /** @return whether we have a next smallest number */
    func hasNext() -> Bool {
        return !stack.isEmpty
    }
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
