import Cocoa

/*
 实现一个 Trie (前缀树)，包含 insert, search, 和 startsWith 这三个操作。

 示例:

 Trie trie = new Trie();

 trie.insert("apple");
 trie.search("apple");   // 返回 true
 trie.search("app");     // 返回 false
 trie.startsWith("app"); // 返回 true
 trie.insert("app");
 trie.search("app");     // 返回 true
 说明:

 你可以假设所有的输入都是由小写字母 a-z 构成的。
 保证所有输入均为非空字符串。
 */

class TrieNode {
    var children = [Character: TrieNode]()
    var isEnd = false
}

class Trie {
    let root = TrieNode()
    /** Initialize your data structure here. */
    init() {

    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        if word.isEmpty {
            return
        }
        
        var currentNode = root
        
        for c in Array(word.lowercased()) {
            if let child = currentNode.children[c] {
                currentNode = child
            } else {
                let node = TrieNode()
                currentNode.children[c] = node
                currentNode = node
            }
        }
        currentNode.isEnd = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        return findNode(of: Array(word.lowercased()))?.isEnd ?? false
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        return findNode(of: Array(prefix.lowercased())) != nil
    }
    
    func findNode(of chars:[Character]) -> TrieNode? {
        if chars.isEmpty {
            return nil
        }
        
        var currentNode = root
        var currentIndex = 0
        
        while currentIndex < chars.count, let child = currentNode.children[chars[currentIndex]] {
            currentNode = child
            currentIndex += 1
        }
        
        return currentIndex == chars.count ? currentNode : nil
    }
}
