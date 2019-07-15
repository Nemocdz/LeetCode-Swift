/*
 * [160] Intersection of Two Linked Lists
 *
 * https://leetcode.com/problems/intersection-of-two-linked-lists/description/
 *
 * algorithms
 * Easy (30.82%)
 * Total Accepted:    244.5K
 * Total Submissions: 793.4K
 * Testcase Example:  'No intersection: []\n[]'
 *
 * Write a program to find the node at which the intersection of two singly
 * linked lists begins.
 * 
 * For example, the following two linked lists: 
 * 
 * A:          a1 → a2
 * ⁠                  ↘
 * ⁠                    c1 → c2 → c3
 * ⁠                  ↗            
 * B:     b1 → b2 → b3
 * 
 * begin to intersect at node c1.
 * 
 * Notes:
 * 
 * If the two linked lists have no intersection at all, return null.
 * The linked lists must retain their original structure after the function
 * returns. 
 * You may assume there are no cycles anywhere in the entire linked structure.
 * Your code should preferably run in O(n) time and use only O(1) memory.
 * 
 * 
 * 
 * Credits:Special thanks to @stellari for adding this problem and creating all
 * test cases.
 */
/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

/**
 * @param {ListNode} headA
 * @param {ListNode} headB
 * @return {ListNode}
 */
var getIntersectionNode = function(headA, headB) {
    let lengthA = 0;
    let lengthB = 0;
    let temp = headA;
    while (temp !== null){
        temp = temp.next;
        lengthA++;
    }
    temp = headB;
    while (temp !== null){
        temp = temp.next;
        lengthB++;
    }
    temp = headA;
    let temp2 = headB;
    if (lengthA > lengthB){
        for (let i = 0; i < lengthA - lengthB; i++){
            temp = temp.next;
        }
    } else {
        for (let i = 0; i < lengthB - lengthA; i++){
            temp2 = temp2.next;
        }
    }

    let node = null;
    while (temp !== null){
        if (temp === temp2){
            return temp;
        }
        temp = temp.next;
        temp2 = temp2.next;
    }
    return node;
};