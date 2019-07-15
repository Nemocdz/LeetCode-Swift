/*
 * [141] Linked List Cycle
 *
 * https://leetcode.com/problems/linked-list-cycle/description/
 *
 * algorithms
 * Easy (34.59%)
 * Total Accepted:    323K
 * Total Submissions: 933.9K
 * Testcase Example:  '[]\nno cycle'
 *
 * 
 * Given a linked list, determine if it has a cycle in it.
 * 
 * 
 * 
 * Follow up:
 * Can you solve it without using extra space?
 * 
 */
/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

/**
 * @param {ListNode} head
 * @return {boolean}
 */
var hasCycle = function(head) {
    if (head === null){
        return false;
    }
    if (head.next === null){
        return false;
    }
    let slow = head;
    let fast = head;
    while (fast !== null){
        slow = slow.next;
        fast = fast.next === null ? fast.next : fast.next.next;
        if (slow === fast) {
            return true
        }
    }
    return false;
};
