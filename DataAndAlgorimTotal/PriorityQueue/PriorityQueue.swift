//
//  PriorityQueue.swift
//  DataAndAlgorimTotal
//
//  Created by 9tong on 2020/1/3.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import Foundation

struct PriorityQueue<Element: Equatable>: Queue {
    private var heap: Heap<Element>
    
    init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
        heap = Heap(sort: sort, elements: elements)
    }
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    var peek: Element? {
        return heap.peek()
    }
    
    mutating func enqueue(_ element: Element) -> Bool {
        heap.insert(element)
        return true
    }
    
    mutating func dequeue() -> Element? {
        return heap.remove()
    }
    
}
