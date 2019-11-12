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
