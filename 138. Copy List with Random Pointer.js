/*
A linked list is given such that each node contains an additional random pointer which could point to any node in the list or null.

Return a deep copy of the list.
*/
/**
 * // Definition for a Node.
 * function Node(val,next,random) {
 *    this.val = val;
 *    this.next = next;
 *    this.random = random;
 * };
 */
/**
 * @param {Node} head
 * @return {Node}
 */
var copyRandomList = function(head) {
    let temp = head;
    let next = head;

    // 交替一原始一复制
    while (temp != null){
        next = temp.next;
        const copy = new Node(temp.val);
        temp.next = copy;
        copy.next = next;
        temp = next;
    }

    temp = head;

    // 给复制加上 random
    while (temp != null){
        // 判断原始是否有 random
        if (temp.random != null) {
            // 将复制的加上原始 random 后面的复制 random
            temp.next.random = temp.random.next;
        }
        // 跳过复制
        temp = temp.next.next;
    }

    temp = head;
    const fakeHead = new Node(-1);
    let copy = fakeHead;
    let copyTemp = fakeHead;


    // 分离复制和原始
    while (temp != null){
        // 下一个原始的
        next = temp.next.next;
        // 下一个复制的
        copy = temp.next;
        // 将复制连起来
        copyTemp.next = copy;
        copyTemp = copy;
        // 原始连回去
        temp.next = next;
        temp = next;
    }

    return fakeHead.next;
};