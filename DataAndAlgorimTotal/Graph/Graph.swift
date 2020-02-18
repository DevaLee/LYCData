//
//  Graph.swift
//  DataAndAlgorimTotal
//
//  Created by 9tong on 2020/2/17.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import Foundation

public protocol Graph {
    associatedtype Element
    
    func createVertex(data: Element) -> Vertex<Element>
    func addDirectedEdge(from source: Vertex<Element>,
                         to destination: Vertex<Element>,
                         weight: Double?)
    func addUndirectedEdge(between source: Vertex<Element>,
                           and destination: Vertex<Element>,
                           weight: Double?)
    func add(_ edge: EdgeType,
             from source: Vertex<Element>,
             to destination: Vertex<Element>,
             weight: Double?)
    
    func edges(from source: Vertex<Element>) -> [Edge<Element>]
    func weight(from source: Vertex<Element>,
                to destination: Vertex<Element>) -> Double?
}


extension Graph {
    
    public func numberOfPaths(from source: Vertex<Element>, to destination: Vertex<Element>) -> Int {
        var numberOfPaths = 0
        var visited: Set<Vertex<Element>> = []
        
        paths(from: source, to: destination, visited: &visited, pathCount: &numberOfPaths)
        
        return numberOfPaths
    }
    
    func paths(from source: Vertex<Element>,
               to destination: Vertex<Element>,
               visited: inout Set<Vertex<Element>>,
               pathCount: inout Int) {
        
        visited.insert(source)
        
        if source == destination {
            pathCount += 1
        }else {
            let neighbors = edges(from: source)
            
            for edge in neighbors {
                if !visited.contains(edge.destination) {
                    paths(from: edge.destination, to: destination, visited: &visited, pathCount: &pathCount)
                }
            }
        }
        visited.remove(source)
    }
}


extension Graph where Element: Hashable {
    
    func breadthFirstSearch(from source: Vertex<Element>) -> [Vertex<Element>] {
        
        var queue = QueueStack<Vertex<Element>>()
        var enqueued: Set<Vertex<Element>> = [] // 已经遍历元素的总和
        var visited:[Vertex<Element>] = []
        
        queue.enqueue(source)
        enqueued.insert(source)
        
        // 当queue中没有数据时，查找结束
        while let vertex = queue.dequeue() {
            visited.append(vertex)
            
            let neighborEdges = edges(from: vertex)
            neighborEdges.forEach { edge in
                // 如果集合中没有edge，进入队列，遍历它的邻居
                if !enqueued.contains(edge.destination) {
                    queue.enqueue(edge.destination)
                    enqueued.insert(edge.destination)
                }
            }
        }
        
        return visited
    }
}
