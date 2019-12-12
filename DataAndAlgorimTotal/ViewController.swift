//
//  ViewController.swift
//  DataAndAlgorimTotal
//
//  Created by liyuchen on 2019/10/22.
//  Copyright © 2019 liyuchen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

      var tree: BinaryNode<Int> = {
          let zero = BinaryNode(value: 5)
          let one = BinaryNode(value: 10)
          let five = BinaryNode(value: 12)
          let seven = BinaryNode(value: 15)
          let eight = BinaryNode(value: 17)
          let nine = BinaryNode(value: 25)
          
          seven.leftChild = one
          one.leftChild = zero
          one.rightChild = five
          seven.rightChild = nine
          nine.leftChild = eight
          
          return seven
        /*
                seven
             
            one         nine
         
         zero   five   eight
         */
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        buildBST()
    }
    
    //MARK: -- BinarySearchTreeChallenage
    func checkIsBinarySearchTree<Element:Comparable>(_ root: BinaryNode<Element>?) -> Bool {
        guard let root = root else {
            return true
        }
        if let left = root.leftChild {
            if left.value > root.value {
                return false
            }
        }
        if let right = root.rightChild {
            if right.value < root.value {
                return false
            }
        }
        
        return checkIsBinarySearchTree(root.leftChild) == true && checkIsBinarySearchTree(root.rightChild) == true
    }
    
    
    
    //MARK: -- BinarySearchTree
    
    func buildBST() {
        var bst = BinarySearchTree<Int>()
        
        bst.insert(3)
        bst.insert(1)
        bst.insert(4)
        bst.insert(0)
        bst.insert(2)
        bst.insert(5)
        bst.insert(6)
//        bst.insert(10)
//        bst.insert(12)
        
        var bst2 = BinarySearchTree<Int>()
        
        bst2.insert(3)
        bst2.insert(1)
        bst2.insert(4)
        bst2.insert(0)
        bst2.insert(2)
        bst2.insert(5)
        bst2.insert(6)
        
        print(bst.containAllElement(subtree: bst2))
        
//        print(bst == bst2)
        //      print(checkIsBinarySearchTree(bst.root))
    }
    
    
    //MARK: --binaryTreeChallenage
    
    func treeHeight<Element>(_ tree: BinaryNode<Element>?) -> Int {
      
        guard let node = tree else {
            return -1
        }
        return 1 + max(treeHeight(node.leftChild), treeHeight(node.rightChild))
    }
    
    func serializationTree<T>(_ tree: BinaryNode<T>) -> [T?]{
        var array = [T?]()
        tree.traverSearialPreOrder { (T) in
            array.append(T)
        }
        return array
    }
    
    //MARK: --binaryTree
    func testTreeNodePostOrder() {
        tree.traversePostOrder { (value) in
            print(value)
        }
    }
    
    func testTreeNodeTraversalInOrder() {
        tree.traverseInOrder { (value) in
            print(value)
        }
    }
    func testTreeNodePreOrderTraversal() {
        tree.traversePreOrder { (value) in
            print(value)
        }
    }
    //MARK: --Tree
    
    func TreechangeOne() {
        let tree = TreeNode(15)

        let one = TreeNode(1)
        let seventeen = TreeNode(17)
        let twenty = TreeNode(20)

        tree.add(one)
        tree.add(seventeen)
        tree.add(twenty)

        let one2 = TreeNode(1)
        let five = TreeNode(5)
        let zero = TreeNode(0)
        let two = TreeNode(2)
        let five2 = TreeNode(5)
        let seven = TreeNode(7)

        one.add(one2)
        one.add(five)
        one.add(zero)

        seventeen.add(two)

        twenty.add(five2)
        twenty.add(seven)
        

        printEachLevel(for: tree)
    }
    
    func printEachLevel<T>(for tree: TreeNode<T>) {
        var queue = QueueArray<TreeNode<T>>()
      
        queue.enqueue(tree)
        var nodeInCurrentLevelCount = 0
        while !queue.isEmpty {
            nodeInCurrentLevelCount = queue.count
            while nodeInCurrentLevelCount > 0 {
                let node = queue.dequeue()
                nodeInCurrentLevelCount -= 1
                node!.children.forEach{queue.enqueue($0)}
                print("\(node!.value ) ", separator: " ", terminator: "")
            }
            print()
        }
        
        
    }

    
    func testLevelForEach() {
        
        let tree = TreeNode("Beverages")
        
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
        
        tree.forEachLevelOrder { (node) in
            print(node.value)
        }
        print("-------------------")
        tree.forEachDepthFirst { (node) in
            print(node.value)
        }
        
        
    
        
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
//MARK: -- BinaryTree
extension ViewController {
    
    
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


