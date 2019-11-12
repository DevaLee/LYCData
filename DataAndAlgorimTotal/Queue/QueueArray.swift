//
//  QueueArray.swift
//  DataAndAlgorimTotal
//
//  Created by liyuchen on 2019/10/22.
//  Copyright © 2019 liyuchen. All rights reserved.
//


public struct QueueArray<T>: Queue {
    
    private var array: [T] = []
    public init() {}
    
    public mutating func enqueue(_ element: T) -> Bool {
        array.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : array.removeFirst()
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var peek: T? {
        return array.first
    }
    
    public typealias Element = T
    
    
}

extension QueueArray: CustomStringConvertible {
    
    public var description: String {
        
        return String(describing: array)
    }
}


extension QueueArray {
    func reversed() -> QueueArray {
       var queue = self
        
        queue.array = queue.array.reversed()
        return queue
    }
}
