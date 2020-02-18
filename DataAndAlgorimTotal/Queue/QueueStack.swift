//
//  QueueStack.swift
//  DataAndAlgorimTotal
//
//  Created by liyuchen on 2019/10/23.
//  Copyright © 2019 liyuchen. All rights reserved.
//

import Foundation

public struct QueueStack<T>: Queue {
    @discardableResult
    public mutating func enqueue(_ element: T) -> Bool {
        rightStack.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        
        return leftStack.popLast()
    }
    
    public var isEmpty: Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }
    
    public var peek: T? {
        return !leftStack.isEmpty ? leftStack.first : rightStack.last
    }
    
    public typealias Element = T
    
    private var leftStack: [T] = []
    private var rightStack: [T] = []
    
    public init() {}
    
}


extension QueueStack {
    
    func queueItemCounts() -> Int {
        return rightStack.count + leftStack.count
    }
}
