import Cocoa

/*
 运用你所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制。它应该支持以下操作： 获取数据 get 和 写入数据 put 。

 获取数据 get(key) - 如果密钥 (key) 存在于缓存中，则获取密钥的值（总是正数），否则返回 -1。
 写入数据 put(key, value) - 如果密钥不存在，则写入其数据值。当缓存容量达到上限时，它应该在写入新数据之前删除最久未使用的数据值，从而为新的数据值留出空间。

 进阶:

 你是否可以在 O(1) 时间复杂度内完成这两种操作？

 示例:

 LRUCache cache = new LRUCache( 2 /* 缓存容量 */ );

 cache.put(1, 1);
 cache.put(2, 2);
 cache.get(1);       // 返回  1
 cache.put(3, 3);    // 该操作会使得密钥 2 作废
 cache.get(2);       // 返回 -1 (未找到)
 cache.put(4, 4);    // 该操作会使得密钥 1 作废
 cache.get(1);       // 返回 -1 (未找到)
 cache.get(3);       // 返回  3
 cache.get(4);       // 返回  4
 */

class LRUCache {
    var map = [Int:DListNode<Int, Int>]()
    let capacity:Int
    let head = DListNode(key: -1, val: -1)
    let tail = DListNode(key: -1, val: -1)
    
    init(_ capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.pre = head
    }
    
    func get(_ key: Int) -> Int {
        if let node = _get(key) {
            _insert(node)
            return node.val
        } else {
            return -1
        }
    }
    
    func _get(_ key:Int) -> DListNode<Int, Int>? {
        if let node = map[key] {
            let pre = node.pre
            let next = node.next
            pre?.next = next
            next?.pre = pre
            return node
        } else {
            return nil
        }
    }
    
    func _insert(_ node:DListNode<Int, Int>) {
        let next = head.next
        head.next = node
        node.pre = head
        node.next = next
        next?.pre = node
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = _get(key) {
            node.val = value
            _insert(node)
        } else {
            let newNode = DListNode(key: key, val: value)
            map[key] = newNode
            _insert(newNode)
            if map.count > capacity {
                if let removeNode = tail.pre {
                    let pre = removeNode.pre
                    pre?.next = tail
                    tail.pre = pre
                    map.removeValue(forKey: removeNode.key)
                }
            }
        }
    }
}

class DListNode<Key,Value> {
    weak var pre:DListNode?
    var next:DListNode?
    let key:Key
    var val:Value
    init(key:Key,val:Value) {
        self.key = key
        self.val = val
    }
}
