//
//  TreeNode.swift
//  DataAndAlgorimTotal
//
//  Created by liyuchen on 2019/10/23.
//  Copyright © 2019 liyuchen. All rights reserved.
//

import Foundation

public class TreeNode<T> {
    public var value: T
    public var children: [TreeNode] = []
    
    public init(_ value: T) {
        self.value = value
    }
    
    public func add(_ child: TreeNode) {
        children.append(child)
    }
}


extension TreeNode {
    
    // Depth - first traversal
    public func forEachDepthFirst(visit: (TreeNode) -> Void) {
        visit(self)
        
        children.forEach {
            $0.forEachDepthFirst(visit: visit)
        }
    }
    
    
    // Level-order traversal
    
    public func forEachLevelOrder(visit: (TreeNode) -> Void) {
        
    }
}
