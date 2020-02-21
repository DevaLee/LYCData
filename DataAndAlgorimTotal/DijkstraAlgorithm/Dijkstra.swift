//
//  Dijkstra.swift
//  DataAndAlgorimTotal
//
//  Created by 9tong on 2020/2/18.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import Foundation

// 狄克斯特拉算法:是一个贪婪算法

/*  应用：
    1, Communicable disease transmission: Discover where biological diseases are spreading the fastes // 传染病传播：发现生物疾病传播最快的地方
    2,Telephone networks: Routing calls to highest-bandwidth paths available in the network // 电话网络：将呼叫路由到网络中可用的最大带宽路径
    3,Mapping: Finding the shortest and fastest paths for travelers // 映射：为旅行者找到最短和最快的路径

 */


public enum Visit<T: Hashable> {
    case start
    case edge(Edge<T>)
}

public class Dijkstra<T: Hashable> {
    public typealias Graph = AdjacencyList<T>
    let graph: Graph
    
    public init(graph: Graph){
        self.graph = graph
    }
    // path： keep track of the total weight from the current vertex back to the start vertex
    private func route(to destination: Vertex<T>, with paths:[Vertex<T>: Visit<T>]) -> [Edge<T>] {
        
        var vertex = destination
        var path: [Edge<T>] = []
        
        while let visit = paths[vertex], case .edge(let edge) = visit {
            path = [edge] + path
            vertex = edge.source
        }
        
        return path
    }
    
    private func distance(to destination: Vertex<T>, with Paths:[Vertex<T>: Visit<T>]) -> Double {
        let path = route(to: destination, with: Paths)
        let distances = path.compactMap { edge -> Double? in
            return edge.weight
        }
        
        return distances.reduce(0.0, +)
    }
    
    
    public func shortestPath(from start:Vertex<T>) -> [Vertex<T> : Visit<T>] {
        
        var paths: [Vertex<T> : Visit<T>] = [start:.start]
        
        var priorityQueue = PriorityQueue.init(sort: {
            self.distance(to: $0, with: paths) < self.distance(to: $1, with: paths)
            
        })
        
        priorityQueue.enqueue(start)
        
        while let vertex = priorityQueue.dequeue() {
            for edge in graph.edges(from: vertex) {
                guard let weight = edge.weight else {
                    continue
                }
                
                if paths[edge.destination] == nil ||
                    distance(to: vertex, with: paths) + weight < distance(to: edge.destination, with: paths) {
                    paths[edge.destination] = .edge(edge)
                    priorityQueue.enqueue(edge.destination)
                }
            }
        }
        
       return paths
    }
    
    public func shortestPath(to destination: Vertex<T>, paths:[Vertex<T>: Visit<T>]) -> [Edge<T>] {
        
        return route(to: destination, with: paths)
    }
}
