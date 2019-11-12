//
//  DoubleLinkedList.swift
//  DataAndAlgorimTotal
//
//  Created by liyuchen on 2019/10/22.
//  Copyright © 2019 liyuchen. All rights reserved.
//


public class DoublyLinkedList<T> {
    public var head: Node<T>?
    public var tail: Node<T>?
    
    public init() {}
    
    public var isEmpty: Bool{
        
        return head == nil
    }
    
    public var first: Node<T>? {
        return head
    }
    
    public func append(_ value: T) {
        
        guard !isEmpty else {
            head = Node(value: value)
            tail = head
            return
        }
        
        let newNode = Node(value: value)
        
        newNode.previous = tail
        
        tail?.next = newNode
        tail = newNode
    }
    
    public func remove(_ node: Node<T>) -> T {
        
        
        if let prevNode = node.previous {
            prevNode.next = node.next
        }else {
            head = node.next
        }
        
        if let nextNode = node.next {
            nextNode.previous = node.previous
        }else {
            tail = node.previous
        }

        node.next = nil
        node.previous = nil
        
        return node.value
    }
}

extension DoublyLinkedList: CustomStringConvertible {
    
    public var description: String {
        var string = ""
        var current = head
        
        while let node = current {
            string.append("\(node.value) ->")
            current = node.next
        }
        
        return string + " end"
    }
}

public class LinkedListIterator<T>: IteratorProtocol {
    private var current: Node<T>?
    
    init(node: Node<T>?) {
        current = node
    }
    public  func next() -> Node<T>? {
        defer {
            current = current?.next
        }
        
        return current
    }
}

extension DoublyLinkedList : Sequence {
    
    public  func makeIterator() -> LinkedListIterator<T> {
        
        return LinkedListIterator(node: head)
    }
}
