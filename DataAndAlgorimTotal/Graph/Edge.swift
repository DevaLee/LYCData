//
//  EdgeType.swift
//  DataAndAlgorimTotal
//
//  Created by 9tong on 2020/2/17.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import Foundation

public struct Edge<T> {
    public let source: Vertex<T>
    public let destination: Vertex<T>
    public let weight: Double?
}


public enum EdgeType {
    case directed
    case undirected
}



