//
//  Vertex.swift
//  DataAndAlgorimTotal
//
//  Created by 9tong on 2020/2/17.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import Foundation


public struct Vertex<T>  {
    public let index: Int
    
    public let data: T
}



extension Vertex: Hashable{
    public var hashValue: Int {
        return index.hashValue
    }
    public static func ==(lhs: Vertex, rhs: Vertex) -> Bool {
                 return lhs.index == rhs.index
          }
}



extension Vertex: CustomStringConvertible {
    public var description: String {
        return "\(index) : \(data)"
    }
}
