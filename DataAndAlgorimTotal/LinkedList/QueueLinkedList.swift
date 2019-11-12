//
//  QueueLinkedList.swift
//  DataAndAlgorimTotal
//
//  Created by liyuchen on 2019/10/23.
//  Copyright © 2019 liyuchen. All rights reserved.
//

import Foundation

public class QueueLinkedList<T>: Queue {
    public func enqueue(_ element: T) -> Bool {
        list.append(element)
        return true
    }
    
    public func dequeue() -> T? {
        guard !isEmpty, let firstNode = list.first else {
            return nil
        }
        
       return  list.remove(firstNode)
    }
    
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
    public var peek: T? {
        
        return list.first?.value
    }
    
    public typealias Element = T
    
    private var list = DoublyLinkedList<T>()
    
    public init() {}
}
