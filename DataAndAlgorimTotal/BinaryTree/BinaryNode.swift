//
//  BinaryNode.swift
//  DataAndAlgorimTotal
//
//  Created by 9tong on 2019/11/28.
//  Copyright © 2019 liyuchen. All rights reserved.
//

import Foundation
public class BinaryNode<Element> {
    
    public var value: Element
    public var leftChild: BinaryNode?
    public var rightChild: BinaryNode?
    
    public init(value: Element) {
        self.value = value
    }
    
    func traverseInOrder(visit:(Element)->()) {
        leftChild?.traverseInOrder(visit: visit)
        visit(self.value)
        rightChild?.traverseInOrder(visit: visit)
        
    }
    
    func traversePreOrder(visit:(Element)->()) {
        visit(self.value)
        leftChild?.traversePreOrder(visit: visit)
        rightChild?.traversePreOrder(visit: visit)
    }
    
    func traversePostOrder(visit:(Element)->()){
        leftChild?.traversePostOrder(visit: visit)
        rightChild?.traversePostOrder(visit: visit)
        visit(self.value)
    }
    
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


