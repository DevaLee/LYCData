//
//  LinkedList.swift
//  DataAndAlgorimTotal
//
//  Created by liyuchen on 2019/10/22.
//  Copyright © 2019 liyuchen. All rights reserved.
//

import Foundation

public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?
    public init() {}
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    
    public func length() -> Int{
        var i = 0
        var runner = head
        while runner != nil {
            i += 1
            runner = runner?.next
        }
        return i
    }
    
    
    // push append insert(after:)
    
    public mutating func push(_ value: Value){
        let node = Node(value: value, next:head)
        head = node
        
        
        if(tail == nil){
            tail = head
        }
    }
    
    public mutating func append(_ value: Value) {
         let node = Node(value: value, next: nil)
        if isEmpty {
            head = node
            tail = node
        }else {
            tail!.next = node
            tail = node
        }
    }
    
    public func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while  currentIndex < index && currentNode != nil  {
            currentNode = currentNode?.next
            currentIndex += 1
        }
        return currentNode
    }
    
    @discardableResult
    public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
        guard tail !== node else {
            append(value)
            return tail!
        }
        
//        let insertNode = Node(value: value)
//        insertNode.next = node.next
//        node.next = insertNode
        
        node.next = Node(value:  value, next: node.next)
       
        return node.next!
    }
    
    // pop removeLast:     remove(at:)
    
    @discardableResult
    public mutating func pop() -> Value?{
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    @discardableResult
    public mutating func removeLast() -> Value?{
        guard let head = head else {
            return nil
        }
        
        guard head.next != nil else {
            return pop()
        }
        
        var preNode = head
        var currentNode = head
        
        while let next = currentNode.next {
            preNode = currentNode
            currentNode = next
        }
        preNode.next = nil
        tail = preNode
        
        return currentNode.value
    }
    
    @discardableResult
    public mutating func remove(after node: Node<Value>) -> Value? {
        
        defer {
            node.next = node.next?.next
        }
        
        return node.next?.value
    }
    
    private mutating func copyNodes() {
        guard !isKnownUniquelyReferenced(&head) else {
            return 
        }
        
        
        guard var oldNode = head else {
            return
        }
        
        head = Node(value: oldNode.value)
        
        var newNode = head
        
        while let nextOldNode = oldNode.next {
            newNode!.next = Node(value: nextOldNode.value)
            
            oldNode = nextOldNode
            newNode = newNode!.next
        }
        tail = newNode
    }
}


extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = head else {
            return "Empty List"
        }
        
        return String(describing: head)
    }
}

extension LinkedList: Collection {
   
    
    public struct Index: Comparable {
        public var node: Node<Value>?
        
        static public func == (lhs: Index, rhs: Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }
        
        static public func < (lhs: Index, rhs: Index) -> Bool {
            guard lhs != rhs else {
                return false
            }
            
            let nodes = sequence(first: lhs.node) { $0?.next}
            
            return nodes.contains { $0 === rhs.node }
        }
    }
    
 
    
    public var startIndex: LinkedList<Value>.Index {
        return Index(node: head)
    }
    
    public var endIndex: LinkedList<Value>.Index {
        return Index(node: tail)
    }
    public func index(after i: LinkedList<Value>.Index) -> LinkedList<Value>.Index {
        return Index(node: i.node?.next)
    }
    
    public subscript(position: LinkedList<Value>.Index) ->Value {
        
        return position.node!.value
    }
}
