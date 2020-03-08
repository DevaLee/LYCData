//
//  LinkProgrammer.swift
//  DataAndAlgorimTotal
//
//  Created by 9tong on 2020/2/25.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import UIKit

class LinkProgrammer: NSObject {
    
    //MARK:-- 链表去除重复的节点：借助Dictionary
    /*
     遍历链表，借助Dictionary缓存已经遍历的元素，筛选重复的元素时间复杂度O(N)
     */
    static func deleteDups<T:Hashable>(link :LinkedList<T>)  {
        
        var traceNode = link.head
        var dic :[T : Bool] = [:]
        var previousNode :Node<T>?
        
        while let node = traceNode {
            if dic.keys.contains(node.value) {
                previousNode?.next = traceNode?.next
            }else {
                dic[node.value] = true
                previousNode = node
            }
            traceNode = traceNode?.next
        }
    }

    // a -> a ->a -> b -> a ->b -> e -> c ->b
    //MARK:-- 删除重复元素不使用缓冲区
    static func deleteDupsTwo<T: Equatable>(link: LinkedList<T>) {
        var current = link.head
        
        while current != nil {
            // 去除与current相等的结果
            
            var runner = current
            while runner?.next != nil  {
                if runner?.next?.value == current?.value {
                    runner?.next = runner?.next?.next
                }else {
                    runner = runner?.next
                }
            }
            
            
            current = current?.next
        }
    }
    //MARK:-- 第index个元素值
    // O(N)
    static func nthNode<T>(link: LinkedList<T>, atIndex index: Int) -> T? {
        
        
        var i = 1
        var current = link.head
        var result:T? = nil
        while (current != nil)  {
            if i == index {
                result = current?.value
            }
            
            current = current?.next
            i += 1
        }
        return result
    }

    //MARK:--删除某个节点
    /* 删除单向链表中间的某个节点，假定只能访问该节点
     */
    static func deleteNode<T>(node: Node<T>) ->Bool {
        guard let next = node.next else {
            return false
        }
        
        node.value = next.value
        node.next = next.next
        return true
    }
    
    //MARK: -- 分割
    /*以给定值x为基准将链表分割成两部分，所有小于x的节点排在大于或等于x的节点之前
     */
    static func seperateLinklist<T:Comparable>(linkList:LinkedList<T>, by sepValue:T) ->LinkedList<T> {
        var runner = linkList.head
        var leftLink = LinkedList<T>()
        var rightLink = LinkedList<T>()
        
        while runner != nil {
            if runner!.value > sepValue {
                leftLink.append(runner!.value)
            }else {
                rightLink.append(runner!.value)
            }
            runner = runner!.next
        }
        
        
        var leftRunner = leftLink.head
        while leftRunner != nil {
            rightLink.append(leftRunner!.value)
            leftRunner = leftRunner!.next
        }
        
        return rightLink
    }
    /* 两个链表节点相加 5 -> 9 -> 2 + 7 -> 1 -> 6  = 2 -> 1 ->9 head是各位数
     */
    static func addList(linkOne: LinkedList<Int>, linkTwo: LinkedList<Int>) -> LinkedList<Int> {
        
        var oneNode = linkOne.head
        var twoNode = linkTwo.head
        var carry = 0
        var surplus = 0
        
        var newLink = LinkedList<Int>()
        while oneNode != nil || twoNode != nil {
            var one = 0
            var two = 0
           
            if oneNode != nil {
                one = oneNode!.value
            }
            
            if twoNode != nil {
                two = twoNode!.value
            }
            
            surplus = (one + two + carry) % 10
            carry = (one + two + carry) / 10
         
            
            newLink.append(surplus)
            
            oneNode = oneNode?.next
            twoNode = twoNode?.next
        }
        
        return newLink
    }
    //MARK:-- 两个链表相加，head是高位
    private struct PartialSum {
        var sum: Node<Int>?
        var carry = 0
        
    }
    
    /* 两个链表节点相加 1 -> 2 -> 3 -> 4 + 5 -> 6 -> 7  = 1 -> 8 -> 0 -> 1 head是最高位
     */
    static func addListReverse(linkOne: LinkedList<Int>, linkTwo: LinkedList<Int>) -> Node<Int> {
        
        var oneLink = linkOne
        var twoLink = linkTwo
        
        let len1 = oneLink.length()
        let len2 = twoLink.length()
        
        if len1 < len2 {
            padList(linkList: &oneLink, padding: len2 - len1)
        }else {
            padList(linkList: &twoLink, padding: len1 - len2)
        }
        
        let sum = addListHelper(nodeOne: oneLink.head, nodeTwo: twoLink.head)
        
        if sum.carry == 0 {
            return sum.sum!
        }else {
            return insertBefore(node: sum.sum, data: sum.carry)
        }
     
       
    }
    
    /* 使用0填充高位（head）
     */
    private static func padList(linkList: inout LinkedList<Int>, padding: Int) {
        var head = linkList.head
        
        for _ in 0..<padding {
            let newNode = Node(value: 0)
            head?.previous = newNode
            newNode.next = head
            head = newNode
        }
        
        linkList.head = head
    }
    
    private static func addListHelper(nodeOne: Node<Int>?, nodeTwo: Node<Int>?) -> PartialSum {
        guard nodeOne != nil  || nodeTwo != nil else {
            //如果为空，说明已到最后一个元素，返回一个空节点和 carry== 0 的数据
            return PartialSum()
        }
        let oneRunner = nodeOne
        let twoRunner = nodeTwo
        
        var sum = addListHelper(nodeOne: oneRunner?.next, nodeTwo: twoRunner?.next)
        
        let value = sum.carry + oneRunner!.value + twoRunner!.value
        
        let full_result = insertBefore(node: sum.sum, data: value % 10)
        
        sum.sum = full_result
        sum.carry = value / 10
        
        return sum;
    }
    
    private static func insertBefore(node:Node<Int>?, data: Int) -> Node<Int> {
        let newNode = Node(value: data)
        if node != nil {
            node?.previous = newNode
            newNode.next = node
        }
        
        return newNode
    }
    
    //MARK: -- 检测链表是否是环路
    static func checkLinkIsCircle<T>(node: Node<T>?) ->Bool {
        var flag = false
        
        var slowNode = node;
        var fastNode = node;
        
        while slowNode != nil && fastNode != nil {

            if let _ = fastNode?.next, let fnextnext = fastNode?.next?.next {
                fastNode = fnextnext
                slowNode = slowNode?.next
                if fastNode == slowNode {
                    flag = true
                    break
                }else {
                    flag = false
                }
            }else {
                flag = false
                break
            }
            
        }
        
        return flag
    }
    
    //MARK:--给定一个有环链表，实现一个算法返回环路的开头节点
    /*
     给定一个有环链表，实现一个算法返回环路的开头节点
     1，创建两个指针，slow和fast
     2，slow走一步，fast走两步
     3，两者碰撞在一起时，slow指向链表的header， fast不变
     4，一次一步，以相同的速度返回新的碰撞处
     */
    
    
    static func findBegining<T>(linkNode:Node<T>?) -> Node<T>? {
        var slowNode = linkNode
        var fastNode = linkNode
        
        var beginNode: Node<T>?
        while slowNode != nil, fastNode != nil {
            if ((fastNode?.next?.next) != nil) && ((fastNode?.next) != nil) {
                let slowNext = slowNode?.next
                let fastNext = fastNode?.next?.next
                
                if fastNext == slowNext {
                    
                    beginNode = findSecondCollision(slow: linkNode, fast: fastNext)
                    break
                }else {
                    slowNode = slowNext
                    fastNode = fastNext
                }
                
            }else {
                break
            }
            
        }
        return beginNode
    }
    
    private static func findSecondCollision<T>(slow:Node<T>?, fast:Node<T>?) -> Node<T>?{
        
        var slowNode = slow
        var fastNode = fast

        while slowNode != fastNode {
            slowNode = slowNode?.next
            fastNode = fastNode?.next
        }
    
        return slowNode
    }
    
    //MARK:-- 检查链表是否是回文
    static func isPalindrome<T: Equatable>(node: Node<T>?) -> Bool {
        
        var slowRunner = node
        var fastRunner = node
        var stack = Stack<Node<T>?>()
        while fastRunner != nil && fastRunner?.next != nil {
            stack.push(slowRunner)
            slowRunner = slowRunner?.next
            fastRunner = fastRunner?.next?.next
        }
        // 奇数
        if fastRunner != nil && fastRunner?.next == nil {
            slowRunner = slowRunner?.next
        }
        
        var flag = true
        
        var popNode = stack.pop() as? Node<T>
        
        while slowRunner != nil  {
            if popNode?.value != slowRunner?.value {
                flag = false
                break
            }else {
                popNode = stack.pop() as? Node<T>
                slowRunner = slowRunner?.next
            }
        }
        return flag
    }
}












