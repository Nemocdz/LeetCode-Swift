/*
 * @lc app=leetcode id=236 lang=javascript
 *
 * [236] Lowest Common Ancestor of a Binary Tree
 */
/**
 * Definition for a binary tree node.
 * function TreeNode(val) {
 *     this.val = val;
 *     this.left = this.right = null;
 * }
 */
/**
 * @param {TreeNode} root
 * @param {TreeNode} p
 * @param {TreeNode} q
 * @return {TreeNode}
 */
var lowestCommonAncestor = function(root, p, q) {
    if (root == null || root == p || root == q) {
        return root;
    }

    const leftNode = lowestCommonAncestor(root.left, p, q);
    const rightNode = lowestCommonAncestor(root.right, p, q);

    if (leftNode == null) {
        return rightNode;
    } else if (rightNode == null) {
        return leftNode;
    } else {
        return root;
    }
};




