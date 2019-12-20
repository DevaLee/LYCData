//
//  RedBlackTree.swift
//  DataAndAlgorimTotal
//
//  Created by 9tong on 2019/12/17.
//  Copyright © 2019 liyuchen. All rights reserved.
//

import Foundation
/**
 1,Every node is either red or black
 2,The root is black
 3,Every leaf (nullLeaf) is black
 4,If a node is red, then both its children are black
 5,对于每个节点，从节点到后代叶子的所有路径都包含相同数量的黑色节点
 */



private enum RBTreeColor {
    case red
    case black
}

private enum RotationDirection {
    case left
    case right
}

public class RBTreeNode<T: Comparable> :Equatable {

    public typealias RBNode = RBTreeNode<T>
    fileprivate var color: RBTreeColor = .black
    fileprivate var key: T?
    var leftChild: RBNode?
    var rightChild: RBNode?
    fileprivate weak var parent: RBNode?
    
    public init(key: T?, leftChild: RBNode?, rightChild: RBNode?, parent: RBNode?) {
        self.key = key
        self.leftChild = leftChild
        self.rightChild = rightChild
        self.parent = parent
        
        self.rightChild?.parent = self
        self.leftChild?.parent = self
    }
    
    public convenience init(key: T?) {
        self.init(key: key, leftChild: RBNode(), rightChild: RBNode(), parent: RBNode())
    }
    
    public convenience init() {
       self.init(key: nil, leftChild: nil, rightChild: nil, parent: nil)
       self.color = .black
    }
    
    public func getKey() -> T? {
        return key
    }
    
    var isRoot: Bool {
        return parent == nil
    }
    
    var isLeaf: Bool {
        return rightChild == nil && leftChild == nil
    }
    
    var isNullLeaf: Bool {
        return key == nil && isLeaf && color == .black
    }
    
    var isLeftChild: Bool {
        
        return parent?.leftChild === self
    }
    
    var isRightChild: Bool {
        return parent?.rightChild === self
    }
    
    var grandparent: RBNode? {
        return parent?.parent
    }
    // 兄弟
    var sibling: RBNode? {
        if isLeftChild {
            return parent?.rightChild
        } else {
            return parent?.leftChild
        }
    }
    
    var uncle: RBNode? {
        return parent?.sibling
    }
}

public class RedBlackTree<T: Comparable> {
    public typealias RBNode = RBTreeNode<T>
    fileprivate(set) var root: RBNode
    fileprivate(set) var size = 0
    fileprivate let nullLeaf = RBNode()
    
    public init() {
        
        root = nullLeaf
    }
}

// MARK: -- Equable
extension RBTreeNode {
    public static func == (lhs: RBTreeNode<T>, rhs: RBTreeNode<T>) -> Bool {
        return lhs.key == rhs.key
    }
}

//MARK: -- Searching
extension RBTreeNode {
    /*
     * The predecessor is a node with the next smaller key value of the current node
     */
    public func getPredecessor() -> RBNode? {
        if let leftChild = leftChild, !leftChild.isNullLeaf {
            return leftChild.maximum()
        }
        
        var currentNode = self
        var parent = currentNode.parent
        while currentNode.isLeftChild {
            if let parent = parent {
                currentNode = parent
            }
            parent = currentNode.parent
        }
        return parent
    }
    
    /*
     * Returns the inorder successor node of a node
     * The successor is a node with the next larger key value of the current node
     */
    public func getSuccessor() -> RBNode? {
        if let rightChild = rightChild, !rightChild.isNullLeaf {
            return rightChild.minimum()
        }
        
        var currentNode = self
        var parent = currentNode.parent
        
        while currentNode.isRightChild {
            if let parent = parent {
                currentNode = parent
            }
            parent = currentNode.parent
        }
        return parent
    }
}

extension RBTreeNode {
    public func minimum() -> RBNode? {
        if let leftChild = leftChild {
            if !leftChild.isNullLeaf {
                return leftChild.minimum()
            }else {
                return self
            }
        }else {
            return self
        }
    }
    
    public func maximum() -> RBNode? {
        if let rightChild = rightChild {
            if !rightChild.isNullLeaf {
                return rightChild.maximum()
            }else {
                return self
            }
        } else {
            return self
        }
        
    }
}

extension RedBlackTree {
    /*
     Returns the node with the given key |input| if existing
     */
    public func search(input: T) -> RBNode? {
        return search(key: input, node: root)
    }
    
    fileprivate func search(key: T, node: RBNode?) -> RBNode? {
        guard let node = node else {
            return nil
        }
        if !node.isNullLeaf {
            if let nodeKey = node.key {
                if key == nodeKey {
                    return node
                }else if key < nodeKey {
                    return search(key: key, node: node.leftChild)
                }else {
                    return search(key: key, node: node.rightChild)
                }
            }
        }
        return nil
    }
}

extension RedBlackTree {
    
    public func minValue() -> T? {
        guard let minNode = root.minimum() else {
            return nil
        }
        return minNode.key
    }
    
    public func maxValue() -> T? {
        guard let maxNode = root.maximum() else {
            return nil
        }
        return maxNode.key
    }
}

// MARK: -- Inserting new nodes
extension RedBlackTree {
    
    public func insert(key: T) {
        if root.isNullLeaf {
            root = RBNode(key: key)
        } else {
            insert(input: RBNode(key: key), node: root)
        }
        size += 1
    }
    
    private func insert(input: RBNode, node: RBNode) {
        guard let inputKey = input.key, let nodeKey = node.key else {
            return
        }
        
        if inputKey < nodeKey {
            guard let child = node.leftChild else {
                addAsLeftChild(child: input, parent: node)
                return
            }
            if child.isNullLeaf {
                addAsLeftChild(child: input, parent: node)
            }else {
                insert(input: input, node: node)
            }
        } else {
            guard let child = node.rightChild else {
                addAsRightChild(child: input, parent: node)
                return
            }
            
            if child.isNullLeaf {
                addAsRightChild(child: input, parent: node)
            } else {
                insert(input: input, node: child)
            }
        }
    }
    
    private func addAsLeftChild(child: RBNode, parent: RBNode) {
        parent.leftChild = child
        child.parent = parent
        child.color = .red
    }
    
    private func addAsRightChild(child: RBNode, parent: RBNode) {
        parent.rightChild = child
        child.parent = parent
        child.color = .red
    }
    
    private func insertFixup(node z: RBNode) {
        if z.isNullLeaf {
            guard let parentZ = z.parent else {
                return
            }
            
            // fix  -> |z| and his parent are red
            if parentZ.color == .red {
                guard let uncle = z.uncle else {
                    return
                }
                // Case 1: Uncle red -> recolor + move z
                if uncle.color == .red {
                    parentZ.color = .black
                    uncle.color = .black
                    if let grandparentZ = parentZ.parent {
                        grandparentZ.color = .red
                        // Move z to grandParent and check again
                        insertFixup(node: grandparentZ)
                    }
                }
            // Case 2: Uncle black
            }else {
                var zNew = z
                if parentZ.isLeftChild && z.isRightChild {
                    zNew = parentZ
                    
                }
            }
            
            
        }
    }
}

//MARK: -- Rotation
extension RedBlackTree {
    
    private func rotate(node x: RBNode, direction: RotationDirection) {
        var nodeY: RBNode? = RBNode()
        switch direction {
            case .left:
                nodeY = x.rightChild
                x.rightChild = nodeY?.leftChild
                x.rightChild?.parent = x
            case .right:
                nodeY = x.leftChild
                x.leftChild = nodeY?.rightChild
                x.leftChild?.parent = x
        }
        
        nodeY?.parent = x.parent
        if x.isRoot {
            if let node = nodeY {
                root = node
            }
        }else if x.isLeftChild {
            
            x.parent?.leftChild = nodeY
        }else if x.isRightChild {
            
            x.parent?.rightChild = nodeY
        }
    }
}

