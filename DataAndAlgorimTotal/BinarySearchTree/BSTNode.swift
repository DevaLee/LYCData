//
//  BSTNode.swift
//  DataAndAlgorimTotal
//
//  Created by 9tong on 2019/12/11.
//  Copyright © 2019 liyuchen. All rights reserved.
//

import Foundation

/**
 1, Left Child 小于 Parent
 2, Right Child 大于 Parent
 */

public struct BinarySearchTree<Element: Comparable> {
    public private (set) var root: BinaryNode<Element>?
    public init() {}
}

extension BinarySearchTree: CustomStringConvertible {
    
    public mutating func insert(_ value: Element) {
        root = insert(from: root, value: value)
    }
    
    private func insert(from node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element> {
        guard let node = node else {
            return BinaryNode(value: value)
        }
        if value < node.value {
            node.leftChild = insert(from: node.leftChild, value: value)
        } else {
            node.rightChild = insert(from: node.rightChild, value: value)
        }
        return node
    }
    
    
    public var description: String {
        guard let root = root else { return "Empty tree" }
        return String(describing: root)
    }
}

extension BinarySearchTree {
    
//    public func contains(_ value: Element) -> Bool {
//        guard let root = root else {
//            return false
//        }
//        var found = false
//
//        root.traverseInOrder {
//            if $0 == value {
//                found = true
//            }
//        }
//        return found
//    }
    //MARK:-- 是否包含
    public func contains(_ value: Element) -> Bool {
        var current = root
        
        while let node = current {
            if value < node.value {
                current = node.leftChild
            }else if value == node.value {
                return true
            }else {
                current = node.rightChild
            }
        }
        
        return false
    }
    
    //MARK: -- 删除
    public mutating func remove(_ value: Element) {
        root = remove(node: root, value: value)
    }
    
    private func remove(node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
        guard let node = node else {
            return nil
        }
        if value == node.value {
            // 1,对当前节点重新赋值，将当前节点下的最小值赋值给当前节点。
            // 2,将最小值的节点置为nil。
            if node.leftChild == nil && node.rightChild == nil {
                return nil
            }
            
            if node.leftChild == nil {
                return node.rightChild
            }
            
            if node.rightChild == nil {
                return node.leftChild
            }
            
            node.value = node.rightChild!.min.value
            node.rightChild = remove(node: node.rightChild, value: node.value)
            
        } else if value < node.value {
            node.leftChild = remove(node: node.leftChild, value: value)
        } else {
            node.rightChild = remove(node: node.rightChild, value: value)
        }
        
        return node
        
    }
}

private extension BinaryNode {
    
    var min: BinaryNode {
        return leftChild?.min ?? self
    }
    
}


extension BinarySearchTree: Equatable {
    public static func == (lhs: BinarySearchTree<Element>, rhs: BinarySearchTree<Element>) -> Bool {
        
        return equal(lhs: lhs.root, rhs: rhs.root)
    }
    
    public static func equal<Element: Equatable> (lhs: BinaryNode<Element>?, rhs: BinaryNode<Element>?) ->Bool{
        if lhs == nil && rhs != nil {
            return false
        }
        
        if lhs != nil && rhs == nil {
            return false
        }
        
        guard let lhsNode = lhs, let rhsNode = rhs else {
            return true
        }
    
        if lhsNode.value != rhsNode.value {
            return false
        }
        
        
        return equal(lhs: lhsNode.rightChild, rhs: rhsNode.rightChild) && equal(lhs: lhsNode.leftChild, rhs: rhsNode.leftChild)
        
    }
}

extension BinarySearchTree where Element: Hashable {
    public func containAllElement(subtree: BinarySearchTree) -> Bool {
        var set = Set<Element>()
        var contain = true
        root?.traverseInOrder(visit: { (value) in
            set.insert(value)
        })
        
        subtree.root?.traverseInOrder(visit: { (value) in
            contain = contain && set.contains(value)
        })
        return contain
    }
}

