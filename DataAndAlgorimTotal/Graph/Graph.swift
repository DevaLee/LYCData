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
    /*
     1，Generating a minimum-spanning tree
     2，Finding potential paths between vertices
     3，Finding the shortest path between two vertices
     */
    
    // 广度优先搜索
    func breadthFirstSearch(from source: Vertex<Element>) -> [Vertex<Element>] {
        
        var queue = QueueStack<Vertex<Element>>()
        var enqueued: Set<Vertex<Element>> = [] // 已经遍历元素的总和
        var visited:[Vertex<Element>] = []
        
        var maxNum = 1
        queue.enqueue(source)
        enqueued.insert(source)
        
        // 当queue中没有数据时，查找结束
        while let vertex = queue.dequeue() {
            visited.append(vertex)
            
            maxNum = maxNum > queue.queueItemCounts() ?  maxNum : queue.queueItemCounts()
            
            let neighborEdges = edges(from: vertex)
            neighborEdges.forEach { edge in
                // 如果集合中没有edge，进入队列，遍历它的邻居
                if !enqueued.contains(edge.destination) {
                    queue.enqueue(edge.destination)
                    enqueued.insert(edge.destination)
                }
            }
        }
        
        print("max Item Number of Item In Queue \(maxNum)")
        return visited
    }
}




extension Graph where Element: Hashable {
    /*
     1,拓扑排序
     2,Detecting a cycle
     3，Path finding, such as in maze puzzles  （maze puzzles: 迷宫拼图）
     4，Finding connected components in a sparse graph（在稀疏图中查找连接的组件）
     */
    
    func depthFirstSearch(from source: Vertex<Element>) -> [Vertex<Element>] {
        var stack: Stack<Vertex<Element>> = [] // 路径
        var pushed: Set<Vertex<Element>> = [] // 记录已经访问的
        var visited: [Vertex<Element>] = [] // 最终的结果
        
        stack.push(source)
        pushed.insert(source)
        visited.append(source)
       
        outer : while let vertex = stack.peek() {
            let neighbors = edges(from: vertex)
            
            guard !neighbors.isEmpty else {
                stack.pop()
                continue
            }
            
            for edge in neighbors {
                // 没有访问过
                if !pushed.contains(vertex) {
                    stack.push(edge.destination)
                    pushed.insert(edge.destination)
                    visited.append(edge.destination)
                    
                    continue outer
                }
            }
            
            // 该节点全都访问过后在将该节点pop
            stack.pop()
        }
        
        
        return visited
    }
}
