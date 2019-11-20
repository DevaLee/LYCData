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
    
    public private(set) var count = 0
    @discardableResult
    public mutating func enqueue(_ element: T) -> Bool {
        count += 1
        array.append(element)
        return true
    }
    
    public mutating func dequeue() -> T? {
       
        if isEmpty {
            return nil
        }else {
            let value = array.removeFirst()
            count -= 1
            return value
        }
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
