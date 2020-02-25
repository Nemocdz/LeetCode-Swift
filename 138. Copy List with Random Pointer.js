// 给定一个链表，每个节点包含一个额外增加的随机指针，该指针可以指向链表中的任何节点或空节点。

// 要求返回这个链表的深拷贝。 

//  

// 示例：



// 输入：
// {"$id":"1","next":{"$id":"2","next":null,"random":{"$ref":"2"},"val":2},"random":{"$ref":"2"},"val":1}

// 解释：
// 节点 1 的值是 1，它的下一个指针和随机指针都指向节点 2 。
// 节点 2 的值是 2，它的下一个指针指向 null，随机指针指向它自己。
//  

// 提示：

// 你必须返回给定头的拷贝作为对克隆列表的引用。
/**
 * @param {Node} head
 * @return {Node}
 */
var copyRandomList = function(head) {
    let temp = head;
    let next = head;

    // 交替一原始一复制
    while (temp !== null){
        next = temp.next;
        const copy = new Node(temp.val);
        temp.next = copy;
        copy.next = next;
        temp = next;
    }

    temp = head;

    // 给复制加上 random
    while (temp !== null){
        // 判断原始是否有 random
        if (temp.random !== null) {
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
    while (temp !== null){
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