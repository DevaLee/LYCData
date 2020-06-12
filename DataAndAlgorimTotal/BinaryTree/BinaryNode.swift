//
//  BinaryNode.swift
//  DataAndAlgorimTotal
//
//  Created by 9tong on 2019/11/28.
//  Copyright © 2019 liyuchen. All rights reserved.
//

import Foundation

public class BinaryTree<Element: Equatable> {
    public var root: BinaryNode<Element>?


}


public class BinaryNode<Element: Equatable> {
    
    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    public var parentNode: BinaryNode?
    
    public init(value: Element) {
        self.value = value
    }

    /*
     中序遍历
     */
    func traverseInOrder(visit:(Element)->()) {
        leftChild?.traverseInOrder(visit: visit)
        visit(self.value)
        rightChild?.traverseInOrder(visit: visit)
        
    }

    /*
     前序遍历节点值
     */
    func traversePreOrder(visit:(Element)->()) {
        visit(self.value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }


    /*
     前序遍历节点
     */
    func traversePreOrderNode(visit:(BinaryNode) -> ()){
        visit(self)
        leftChild?.traversePreOrderNode(visit: visit)
        rightChild?.traversePreOrderNode(visit: visit)
    }

    /*
     后序遍历
     */
    func traversePostOrder(visit:(Element)->()){
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(self.value)
    }

    /*
     序列化

                         15
                       /    \
                      10     25
                     /  \    /
                    5   12   17

     输出结果： [15, 10, 5, nil, nil, 12, nil, nil, 25, 17, nil, nil, nil]
     */
    func traverSearialPreOrder(visit:(Element?)->()) {
        visit(self.value)
        if let left = leftChild {
            left.traverSearialPreOrder(visit: visit)
        }else {
            visit(nil)
        }
        
        if let right = rightChild {
            right.traverSearialPreOrder(visit: visit)
        }else {
            visit(nil)
        }
    }

    /*
     同级遍历
     */
    func traverSameLevel(visit:(Element?) ->()) {
        var queue = QueueArray<BinaryNode?>()
        queue.enqueue(self)
        while let node = queue.dequeue() {
            if let leftChild = node?.leftChild {
                queue.enqueue(leftChild)
            }
            if let rightChild = node?.rightChild {
                queue.enqueue(rightChild)
            }
            visit(node?.value)
        }
    }


    //MARK: -- tree Height (recursive)
    func treeHeight() -> Int {
        
        return 1 + max(self.rightChild?.treeHeight() ?? 0 , self.leftChild?.treeHeight() ?? 0)
    }

    //MARK: -- tree Height (iteration)

    /**
            使用同级遍历，在遍历完一层后，height + 1
     */
    func treeHeightIteration() -> Int {
        var queue = QueueArray<BinaryNode?>()
        queue.enqueue(self)
        var levelSize = 1 // 同一级包含的节点数
        var height = 1 // 树的高度
        while let node = queue.dequeue() {

            // 出队时 levelSize - 1
            levelSize -= 1

            if let leftChild = node?.leftChild {

                queue.enqueue(leftChild)
            }
            if let rightChild = node?.rightChild {

                queue.enqueue(rightChild)
            }

            // 当levelSize == 0时，同一级的已完全出队
            if levelSize == 0  && queue.count != 0{
                height += 1
                levelSize = queue.count
            }
        }

        return height
    }

    //MARK: -- 判断一棵树是否为完全二叉树
    /*
     使用同级遍历每一个节点
     */
    func isFullBinaryNode() -> Bool {

        var queue = QueueArray<BinaryNode?>()
        queue.enqueue(self)

        var needLeafNode = false

        while let node = queue.dequeue() {

            if needLeafNode && (node?.leftChild != nil || node?.rightChild != nil) {
                return false
            }

            // 当左子节点不为空，将左子节点入队
            if let leftChild = node?.leftChild {
                queue.enqueue(leftChild)
            }

            // 当左子节点为空，右子节点不为空，返回 false
            if node?.leftChild == nil && node?.rightChild != nil {
                return false
            }

            // 当右子节点不为空，将右子节点入队
            if let rightChild = node?.rightChild {
                queue.enqueue(rightChild)
            }else {
                // 当右子节点为空时，以后遍历的所有节点应该都为叶子节点，才是完全二叉树
                needLeafNode = true
            }
        }

        return true
    }

    func containNode(_ lookNode: BinaryNode<Element>) -> Bool {
        var contain = false

        self.traversePreOrderNode { (node) in
            if node.value == lookNode.value {
                contain = true
            }
        }
        return contain
    }


    /*
         前驱节点：中序遍历时的前一个节点
         在二叉搜索树中，前驱节点就是前一个比它小的节点
         */
     func processorNode(_ node: BinaryNode<Element>) -> BinaryNode<Element>? {

         // 如果 node.left != nil, prodecessor = node.left.right.right...直到 right 为 nil 为止
         if node.leftChild != nil {
             var childNode = node.leftChild
             while childNode?.rightChild != nil {
                 childNode = childNode?.rightChild
             }
             return childNode
         }
         // 如果 左子节点为nil，父节点不为nil，该节点为最小值，则 prodecessor = node.parent.parent...
         // 终止条件： node在parent的右子树中
        else if node.leftChild == nil && node.parentNode != nil {
            var cur = node
            while cur.parentNode != nil &&  !(cur.parentNode?.rightChild?.containNode(node) ?? false) {
                cur = cur.parentNode!
             }
            return cur.parentNode
         }
        else  {
             //  node.leftChild == nil && node.parentNode == nil
             return nil
         }
     }

    /*
     后驱节点：中序遍历时的后一个节点
     在二叉搜索树中就是后一个比它大的节点
     */

    func successorNode(_ node: BinaryNode<Element>) -> BinaryNode<Element>? {

        if node.rightChild != nil {
            var childNode = node.rightChild
            while childNode?.leftChild != nil {
                childNode = childNode?.leftChild
            }
            return childNode
        }
        else if node.rightChild == nil && node.parentNode != nil {
            var cur = node
            while cur.parentNode != nil &&  !(cur.parentNode?.leftChild?.containNode(node) ?? false) {
                cur = cur.parentNode!
            }
            return cur.parentNode
        }
        else  {
            return nil
        }
    }
}


extension BinaryNode: CustomStringConvertible {
    public var description: String {
        return diagram(for: self)
    }
    
    private func diagram(for node: BinaryNode?,
                           _ top: String = "",
                           _ root: String = "",
                           _ bottom: String = "") -> String {
        guard let node = node else {
          return root + "nil\n"
        }
        if node.leftChild == nil && node.rightChild == nil {
          return root + "\(node.value)\n"
        }
        return diagram(for: node.rightChild,
                       top + " ", top + "┌──", top + "│ ")
             + root + "\(node.value)\n"
             + diagram(for: node.leftChild,
                       bottom + "│ ", bottom + "└──", bottom + " ")
      }
}




extension NSObject {

//    static
    static func isValidBST(_ node: BinaryNode<Int>?) -> Bool {

        var cur = node
        var nodeStack = Stack<BinaryNode<Int>>()
        var minNumber = Int.min

        while !nodeStack.isEmpty() || cur != nil {
            while cur != nil {
                nodeStack.push(cur!)
                cur = cur?.leftChild
            }

            cur = nodeStack.pop()

            print(cur?.value ?? 0)

            if cur?.value ?? 0 < minNumber { return false }
            minNumber = cur?.value ?? 0

            cur = cur?.rightChild

        }

        return true
    }
}


