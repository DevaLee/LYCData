//
//  Prim.swift
//  DataAndAlgorimTotal
//
//  Created by 9tong on 2020/2/21.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import Foundation

// 普里姆算法（Prim算法）：生成最小生成树

public class Prim<T: Hashable> {
    public typealias Graph = AdjacencyList<T>
    public init() {}
    
    
    
    
    
    
    internal func addAvailableEdges(for vertext: Vertex<T>,
                                    in graph: Graph,
                                    check visited: Set<Vertex<T>>,
                                    to priorityQueue: inout PriorityQueue<Edge<T>>) {
        
        for edge in graph.edges(from: vertext) {
            if !visited.contains(edge.destination) {
                priorityQueue.enqueue(edge)
            }
        }
            
    }
    
    
    public func produceMinimumSpanningTree(for graph: Graph) -> (cost: Double, mst: Graph) {
        /*
         1，复制一个只有节点的graph，2，获取起点的所有neighbors，存在最小优先级queue中，以weight做为priority。3，获得最小weight，
         4，将空graph连接起来，5，已当前点作为起点重复以上步骤
         */
        
        
        var cost = 0.0
        let mst = Graph()
        var visited: Set<Vertex<T>> = []
        var priorityQueue = PriorityQueue<Edge<T>>(sort:{
            $0.weight ?? 0.0 < $1.weight ?? 0.0
        }) // min-priority queue
        
        mst.copyVertices(from: graph) // 复制所有节点
        
        guard let start = graph.vertices.first else {
            return (cost: 0, mst: mst)
        }
        
        visited.insert(start)
        
        // 将start的e未访问的neighbors存入 priorityQueue,weight最小的在最上面
        addAvailableEdges(for: start, in: graph, check: visited, to: &priorityQueue)
        
        while let smallestEdge = priorityQueue.dequeue() {
            let vertex = smallestEdge.destination
            
            guard !visited.contains(vertex) else {
                continue
            }
            
            visited.insert(vertex)
            
            cost += smallestEdge.weight ?? 0
            
            mst.add(.undirected, from: start, to: vertex, weight: smallestEdge.weight)
            
            addAvailableEdges(for: vertex, in: graph, check: visited, to: &priorityQueue)
        }
        
        return (cost: cost, mst: mst)
    }
}
















