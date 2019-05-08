import Cocoa
/*
 Implement an iterator over a binary search tree (BST). Your iterator will be initialized with the root node of a BST.
 
 Calling next() will return the next smallest number in the BST.
 
 
 
 Example:
 
 
 
 BSTIterator iterator = new BSTIterator(root);
 iterator.next();    // return 3
 iterator.next();    // return 7
 iterator.hasNext(); // return true
 iterator.next();    // return 9
 iterator.hasNext(); // return true
 iterator.next();    // return 15
 iterator.hasNext(); // return true
 iterator.next();    // return 20
 iterator.hasNext(); // return false
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
