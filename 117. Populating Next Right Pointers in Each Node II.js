/*
Given a binary tree

struct Node {
  int val;
  Node *left;
  Node *right;
  Node *next;
}
Populate each next pointer to point to its next right node. If there is no next right node, the next pointer should be set to NULL.

Initially, all next pointers are set to NULL.
*/

/**
 * // Definition for a Node.
 * function Node(val,left,right,next) {
 *    this.val = val;
 *    this.left = left;
 *    this.right = right;
 *    this.next = next;
 * };
 */
/**
 * @param {Node} root
 * @return {Node}
 */
var connect = function(root) {
    if (root == null) {
        return null;
    }
    let pre = root;
    while (pre != null) {
        const temp = new Node(-1);
        let cur = temp;
        while (pre != null) {
            if (pre.left != null) {
                cur.next = pre.left;
                cur = cur.next;
            }
            if (pre.right != null) {
                cur.next = pre.right;
                cur = cur.next;
            }
            pre = pre.next;
        }
        pre = temp.next;
    }
    return root;
};
