//
//  Node.swift
//  DataAndAlgorimTotal
//
//  Created by liyuchen on 2019/10/22.
//  Copyright © 2019 liyuchen. All rights reserved.
//

import UIKit

public class Node<Value> {

    public var value: Value
    public var next: Node?
    public var previous: Node?
    public var tag: Int?
    
    public init(value: Value, next: Node? = nil ){
        self.value = value
        self.next = next
    }
}


extension Node: CustomStringConvertible {
    
   public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        
        return "\(value) -> " + String(describing: next)
    }
}


extension Node :Equatable {
    
    
    public static func == (lhs: Node<Value>, rhs: Node<Value>) -> Bool {
        
        var lhsC = lhs
        var rhsC = rhs
        return Mems.memStr(ofVal: &lhsC) == Mems.memStr(ofVal: &rhsC)
    }
    
    
}
