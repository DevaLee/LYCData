//
//  Stack.swift
//  DataAndAlgorimTotal
//
//  Created by liyuchen on 2019/10/22.
//  Copyright © 2019 liyuchen. All rights reserved.
//

public struct Stack<Element> {
    private var storage: [Element] = []
    var stackCapacity: Int?
    public init() {
    }
    
    public init(_ elements: [Element]) {
        storage = elements
    }

    public init(capacity: Int) {
        stackCapacity = capacity
    }


    
    
    // push pop
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
      return  storage.popLast()
    }
    
    public func peek() -> Element? {
        return storage.last
    }
    
    public func isEmpty() -> Bool {
        return peek() == nil
    }

    public func isFull() -> Bool {
        return storage.count == stackCapacity
    }
}

extension Stack: CustomStringConvertible {
    
    public var description: String {
        
        let topDivider = "--- top ---\n"
        let bottomDivider = "\n---------"
        
        let stackElements = storage.map {"\($0)"}
            .reversed()
            .joined(separator: "\n")
        
        return topDivider + stackElements + bottomDivider
    }
}

extension Stack: ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = Element
    
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
}





public class StackC<Element> {

    private var storage: [Element] = []
    var stackCapacity: Int?
    public init() {}

    public init(_ elements: [Element]) {
        storage = elements
    }

    public init(capacity: Int) {
        stackCapacity = capacity
    }




    // push pop

    public func push(_ element: Element) {
        storage.append(element)
    }

    @discardableResult
    public func pop() -> Element? {
      return  storage.popLast()
    }

    public func peek() -> Element? {
        return storage.last
    }

    public func isEmpty() -> Bool {
        return peek() == nil
    }

    public func isFull() -> Bool {
        return storage.count == stackCapacity
    }
}

extension StackC {

    public var description: String {

        let topDivider = "--- top ---\n"
        let bottomDivider = "\n---------"

        let stackElements = storage.map {"\($0)"}
            .reversed()
            .joined(separator: "\n")

        return topDivider + stackElements + bottomDivider
    }
}
