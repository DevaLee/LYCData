//
//  GraphTest.swift
//  DataAndAlgorimTotalTests
//
//  Created by 9tong on 2020/2/17.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import XCTest
@testable import DataAndAlgorimTotal


class GraphTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBuildGraph(){
        let graph = AdjacencyList<String>()
        let singapore = graph.createVertex(data: "Singapore")
        let tokyo = graph.createVertex(data: "Tokyo")
        let hongKong = graph.createVertex(data: "Hong Kong")
        let detroit = graph.createVertex(data: "Detroit")
        let sanFrancisco = graph.createVertex(data: "San Francisco")
        let washingtonDC = graph.createVertex(data: "Washington DC")
        let austinTexas = graph.createVertex(data: "Austin Texas")
        let seattle = graph.createVertex(data: "Seattle")
        graph.add(.undirected, from: singapore, to: hongKong, weight: 300)
        graph.add(.undirected, from: singapore, to: tokyo, weight: 500)
        graph.add(.undirected, from: hongKong, to: tokyo, weight: 250)
        graph.add(.undirected, from: tokyo, to: detroit, weight: 450)
        graph.add(.undirected, from: tokyo, to: washingtonDC, weight: 300)
        graph.add(.undirected, from: hongKong, to: sanFrancisco, weight: 600)
        graph.add(.undirected, from: detroit, to: austinTexas, weight: 50)
        graph.add(.undirected, from: austinTexas, to: washingtonDC, weight: 292)
        graph.add(.undirected, from: sanFrancisco, to: washingtonDC, weight: 337)
        graph.add(.undirected, from: washingtonDC, to: seattle, weight: 277)
        graph.add(.undirected, from: sanFrancisco, to: seattle, weight: 218)
        graph.add(.undirected, from: austinTexas, to: sanFrancisco, weight: 297)
        
        print(graph)
        print("==================================================")
        print(graph.weight(from: singapore, to: tokyo) ?? 0)
        
    
        XCTAssertNotNil(graph)
        
    }

    
    func testGraphChallenage(){
        let graph = AdjacencyMatrix<String>()
        
        let vertexA = graph.createVertex(data: "A")
        let vertexB = graph.createVertex(data: "B")
        let vertexC = graph.createVertex(data: "C")
        let vertexD = graph.createVertex(data: "D")
        let vertexE = graph.createVertex(data: "E")
        
        graph.addDirectedEdge(from: vertexA, to: vertexB, weight: 1)
        graph.addDirectedEdge(from: vertexA, to: vertexD, weight: 1)
        graph.addDirectedEdge(from: vertexA, to: vertexE, weight: 1)
        graph.addDirectedEdge(from: vertexA, to: vertexC, weight: 1)
        
        graph.addDirectedEdge(from: vertexB, to: vertexC, weight: 1)
        graph.addDirectedEdge(from: vertexB, to: vertexD, weight: 1)
        
        graph.addDirectedEdge(from: vertexC, to: vertexE, weight: 1)
        
        graph.addDirectedEdge(from: vertexD, to: vertexE, weight: 1)
        
//        let edges = graph.edges(from: vertexA)
//
//        for  edge in edges {
//
//        }
        print(graph.numberOfPaths(from: vertexA, to: vertexE))
       
        
        XCTAssertNotNil(graph)
        
    }
    
    
}
