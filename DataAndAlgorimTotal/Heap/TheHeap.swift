//
//  TheHeap.swift
//  DataAndAlgorimTotal
//
//  Created by 9tong on 2020/1/2.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import Foundation


/*
 1, Max heap: a higher value have a higher priority, the parent value always equal or greater than children
 2, Min heap: a lower value have a higher priority, the parent value always lower than children
 
 heap invariant: 堆不变性
*/
/*
 Heap Application
 1, Calculating the minimum or maximum element of a collection
 2, Heap sort
 3, Constructing a priority queue
 4, Constructing graph algorithms
 */

struct Heap<Element: Equatable> {
    var elements: [Element] = []
    let sort: (Element, Element) -> Bool
    
    init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
        self.sort = sort
        self.elements = elements
        
        if !elements.isEmpty {
            for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
                siftDown(from: i)
            }
        }
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    func peek() -> Element? {
        return elements.first
    }
    
    func leftChildIndex(ofParentAt index: Int) -> Int {
        return (2 * index) + 1
    }
    
    func rightChildIndex(ofParentAt index: Int) -> Int {
        return (2 * index) + 2
    }
    
    func parentIndex(ofChildAt index: Int) -> Int {
        return (index - 1) / 2
    }
    // 删除第一个元素
    mutating func remove() -> Element? {
        guard !isEmpty else {
            return nil
        }
        elements.swapAt(0, count - 1)
        
        defer {
            siftDown(from: 0)
        }
        return elements.removeLast()
    }
    
    mutating func siftDown(from index: Int) {
        var parent = index
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            var candiate = parent
            if left < count && sort(elements[left], elements[candiate]) {
                candiate = left
            }
            
            if right < count && sort(elements[right], elements[candiate]) {
                candiate = right
            }
            
            if candiate == parent {
                return
            }
            
            elements.swapAt(parent, candiate)
            parent = candiate
            
        }
    }
    // 插入元素
    mutating func insert(_ element: Element) {
        elements.append(element)
        
    }
    
    mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(ofChildAt: child)
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        }
    }
    // 删除任意index的元素
    mutating func remove(at index: Int) -> Element? {
        guard index < elements.count else {
            return nil
        }
        
        if index == elements.count - 1 {
            return elements.removeLast()
        }else {
            elements.swapAt(index, elements.count - 1)
            defer {
                siftDown(from: index)
                siftUp(from: index)
            }
            
            return elements.removeLast()
        }
    }
    
    func index(of element: Element, startingAt i: Int) -> Int? {
        if i > count {
            return nil
        }
        
        if sort(element, elements[i]) {
            return nil
        }
        
        if element == elements[i] {
            return i
        }
        
        if let j = index(of: element, startingAt: leftChildIndex(ofParentAt: i)) {
            return j
        }
        
        if let j = index(of: element, startingAt: rightChildIndex(ofParentAt: i)) {
            return j
        }
        return nil
    }
    
    
}
