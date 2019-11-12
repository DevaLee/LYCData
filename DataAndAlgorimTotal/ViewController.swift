//
//  ViewController.swift
//  DataAndAlgorimTotal
//
//  Created by liyuchen on 2019/10/22.
//  Copyright © 2019 liyuchen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       print(test7(str:"bestbestlli"))
    }
    
    func test7(str: String) -> Int{
        let n  = str.count
        var charactes = Set<Character>()
        var ans = 0
        var i = 0
        var j = 0
        
        while (i < n && j < n) {
            if (!charactes.contains(str[str.index(str.startIndex, offsetBy: j)])) {
                charactes.insert(str[str.index(str.startIndex, offsetBy: j)])
                j += 1;
                ans = ans > j - i ? ans : j - i
                
            }else {
                let charac = str[str.index(str.startIndex, offsetBy: i)]
                charactes.remove(charac)
                i += 1
            
            }
        }
        return ans
    }
    
    
    
    
    
    
    
    
    
  
    
    
    func test6() {
   
        var linkOne = LinkedList<Int>()
        linkOne.append(7)
        linkOne.append(2)
        linkOne.append(1)
        
        var linkTwo = LinkedList<Int>()
        linkTwo.append(8)
        linkTwo.append(4)
        linkTwo.append(9)
        
        var one = linkOne.head
        var two = linkTwo.head
        var jinwei = 0
        var newList = LinkedList<Int>()
        while (one != nil || two != nil || jinwei != 0) {
            let num = (one?.value ?? 0) + (two?.value ?? 0) + jinwei
            jinwei = num / 10
            newList.append(num % 10)
            
            one = one?.next
            two = two?.next
        }
        
        print(newList)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func test5()  {
        Times.useTime(function:Fibonacci.fib(_:) , 32)
        Times.useTime(function: Fibonacci.fibTwo(_:), 42)
        
    }
    
    
    
    func test4 () {
        let tree = makeBaverageTree()
        tree.forEachDepthFirst { (treeNode) in
            print(treeNode.value)
        }
    }
    
    
    func test3() {
        var stack = Stack<Int>()
        var linkedList = LinkedList<Int>()
         linkedList.push(3)
         linkedList.push(2)
         linkedList.push(1)
         
         linkedList.append(4)
         linkedList.append(5)
         linkedList.append(6)
        
        var  current = linkedList.head
        while let currentNode = current {
            stack.push(currentNode.value)
            current = currentNode.next
        }
        
        while !stack.isEmpty() {
            if let value = stack.pop() {
                print(value)
            }
        }
        
        let str = "((()(Hello)) )"
       print(checkBalance(str))
    }

        
    func test(){
        
        let node1 = Node(value: 0)
        let node2 = Node(value: 1)
        let node3 = Node(value: 2)
        
        node1.next = node2
        node2.next = node3
        
        print(node1)
    }
    
    func test1()  {
        var linkedList = LinkedList<Int>()
        linkedList.push(3)
        linkedList.push(2)
        linkedList.push(1)
        
        linkedList.append(4)
        linkedList.append(5)
        linkedList.append(6)
        
        var linkedListTwo = LinkedList<Int>()
        
        linkedListTwo.append(1)
        linkedListTwo.append(1)
        linkedListTwo.append(1)
        
        var linkedListThree = mergeSort(linkedList, linkedListTwo)
        
        removeOccurrenceValue(&linkedListThree, value: 1)
        
        print(linkedListThree)
        
       
        
        let node =  linkedList.node(at: 1)
        
        linkedList.insert(7, after: node!)
        print(linkedList)
        
        linkedList.removeLast()
        
        print(linkedList)
        
        let nodeThree = linkedList.node(at: 3)
        linkedList.remove(after: nodeThree!)
        
        
        print(linkedList)
        
        linkedList.pop()
        
        print(linkedList)
        
//        printInReverse(linkedList)
        
        print("==================")
        reversed(&linkedList)
        print(linkedList)
        
     

    }
    
//    func reversePrint( _ linkedList: LinkedList<Int>) {
//
//        var currentNode = linkedList.head
//        var array: [Node<Int>] = [];
//        while let nextNode = currentNode  {
//            array.append(nextNode)
//            currentNode = nextNode.next
//        }
//
//        for node in array.reversed() {
//            print(node.value)
//        }
//    }
//
//    func reversed<T> (_ linkedList: LinkedList<T>) -> LinkedList<T>{
//        var node = linkedList.head
//
//        var i = 0
//        while let currentNode = node {
//            i += 1
//            node = currentNode.next
//        }
//
//        var linkeListTwo : LinkedList<T> = LinkedList<T>()
//        for j in (0..<i).reversed() {
//            let node = linkedList.node(at: j)
//
//            linkeListTwo.append(node!.value)
//        }
//        return linkeListTwo
//    }
    
    func printInReverse<T>(_ list: LinkedList<T>)  {
        printInReverse(list.head)
    }
    
    private func printInReverse<T>(_ node: Node<T>?) {
        guard let node = node else {
            return
        }
    
        printInReverse(node.next)
        print(node.value)
        
    }
    
    func getMiddle<T>(_ list: LinkedList<T>) -> Node<T>? {
        
        var slow = list.head
        var fast = list.head
      
        while let nextFast = fast?.next {
            fast = nextFast.next
            slow = slow?.next
        }
        
        return slow
    }
    
    func reversed<T>(_ linkedList: inout LinkedList<T>) {
        var prev = linkedList.head
        var current = prev?.next
        
        prev?.next = nil
        
        while current != nil {
            let next = current?.next
            
            current?.next = prev
            
            prev = current
            
            current = next
        }
        
        linkedList.head = prev
    }
    
    func mergeSort<T: Comparable>(_ left: LinkedList<T>, _ right: LinkedList<T>) -> LinkedList<T> {
        guard !left.isEmpty else {
            return right
        }
        
        guard !right.isEmpty else {
            return left
        }
        
        var newHead: Node<T>?
        var tail: Node<T>?
        
        var currentLeft = left.head
        var currentRight = right.head
        
        if let leftNode = currentLeft, let rightNode = currentRight {
            if leftNode.value < rightNode.value {
                newHead = leftNode
                currentLeft = leftNode.next
            }else {
                newHead = rightNode
                currentRight = rightNode.next
            }
            
            tail = newHead
        }
        
        while let left = currentLeft, let right = currentRight {
            if left.value < right.value {
                tail?.next = left
                currentLeft = left.next
            }else {
                tail?.next = right
                currentRight = right.next
            }
            
            tail = tail?.next
        }
        
        
        if let leftNode = currentLeft {
            tail?.next = leftNode
            tail = left.tail
        }
        
        if let rightNode = currentRight {
            tail?.next = rightNode
            tail = right.tail
        }
        
        
        var newLinkedList = LinkedList<T>()
        newLinkedList.head = newHead
        newLinkedList.tail = tail
        
        return newLinkedList
        
    }
    
    
    func removeOccurrenceValue<T:Equatable>(_ linkedList: inout LinkedList<T>, value: T) {
        
        var prev = linkedList.head
        var current = linkedList.head
        
        
        while current?.value == value {
            prev = current?.next
            current = current?.next
            linkedList.head = current
        }
        
        while let currentNode = current {
            if currentNode.value == value {
                prev?.next = currentNode.next
                current = currentNode.next
            }else {
                prev = currentNode
                current = currentNode.next
            }
        }
    }

}


// MARK: --- Stack
extension ViewController {
    
    func checkBalance(_ stringOne: String) -> Bool {
        var stack = Stack<Character>()
        
        for character in stringOne {
            if character == "(" {
                stack.push(character)
            }else {
                if character == ")"{
                    if stack.isEmpty() {
                        stack.push(character)
                    }else {
                        stack.pop()
                    }
                }else {
                    
                }
            }
        }
        return stack.isEmpty()
    }
}

// MARK: -- Queue
extension ViewController {
    func boardGameManager() {
        
    }
    
    
}

protocol BoardGameManager {
    associatedtype Player
    
    mutating func nextPlayer() -> Player?
}


public class BoardGame<T>: BoardGameManager {
    public var queue = QueueStack<T>()
    
    init() {}
    
    func nextPlayer() -> T? {
        
        
        return queue.dequeue()
    }
    
    func addPlayer(_ element: T) -> Bool {
        
        return  queue.enqueue(element)
    }
    
    
    typealias Player = T
}

// MARK: -- Tree
extension ViewController {
    
    func makeBaverageTree() -> TreeNode<String> {
      let tree  = TreeNode("Baverages")
      let hot = TreeNode("hot")
      let cold = TreeNode("cold")

      let tea = TreeNode("tea")
      let coffee = TreeNode("coffee")
      let chocolate = TreeNode("cocoa")

      let blackTea = TreeNode("black")
      let greenTea = TreeNode("green")
      let chaiTea = TreeNode("chai")

      let soda = TreeNode("soda")
      let milk = TreeNode("milk")

      let gingerAle = TreeNode("ginger ale")
      let bitterLemon = TreeNode("bitter lemon")

      tree.add(hot)
      tree.add(cold)

      hot.add(tea)
      hot.add(coffee)
      hot.add(chocolate)
    
      cold.add(soda)
      cold.add(milk)

      tea.add(blackTea)
      tea.add(greenTea)
      tea.add(chaiTea)

      soda.add(gingerAle)
      soda.add(bitterLemon)

      return tree
    }
    
}


