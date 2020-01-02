//
//  Trie.swift
//  DataAndAlgorimTotal
//
//  Created by 9tong on 2019/12/19.
//  Copyright © 2019 liyuchen. All rights reserved.
//

import Foundation

public class Trie<CollectionType: Collection & Hashable> where CollectionType.Element: Hashable {
    public typealias Node = TrieNode<CollectionType.Element>
    private let root = Node(key: nil, parent: nil)
    
    public init() {}
    
    public fileprivate(set) var nodeCollections : Set<CollectionType> = []
    
    public var count: Int {
        return nodeCollections.count
    }
    
    public var isEmpty: Bool {
        return nodeCollections.isEmpty
    }
    public func insert(_ collection: CollectionType){
        var current = root
        for element in collection {
            if current.children[element] == nil {
                current.children[element] = Node(key: element, parent: current)
            }
            current = current.children[element]!
        }
     
        if current.isTerminating {
            return
        }else {
            current.isTerminating = true
            nodeCollections.insert(collection)
        }
    }
    
    public func contains(_ collection: CollectionType) -> Bool {
        var current  = root
        for element in collection {
            guard let child = current.children[element]  else {
                return false
            }
            current = child
        }
        
        return current.isTerminating
    }
    
    public func remove(_ collection: CollectionType) {
        // 1 先判断是否包含
        var current = root
        for element in collection {
            guard let child = current.children[element] else {
                return
            }
            current = child
        }
        
        guard current.isTerminating else {
            return
        }
        
        current.isTerminating = false
        
        nodeCollections.remove(collection)
        while let parent = current.parent,
            current.children.isEmpty && !current.isTerminating
            {
                parent.children[current.key!] = nil
                current = parent
        }
    }
}

public extension Trie where CollectionType: RangeReplaceableCollection {
    func collections(startingWith prefix: CollectionType) -> [CollectionType] {
        var current = root
        // 1, 如果不包含 prefix 直接返回[],并找到最后一个节点
        for element in prefix {
            guard let child = current.children[element] else {
                return []
            }
            current = child
        }
        
        return collections(startingWith: prefix, after: current)
    }
    
    func collections(startingWith prefix: CollectionType, after node: Node) -> [CollectionType] {
        // 1
        var results: [CollectionType] = []
        if node.isTerminating {
            results.append(prefix)
        }
        
        // 2
        for child in node.children.values {
            var prefix = prefix
            prefix.append(child.key!)
            results.append(contentsOf: collections(startingWith: prefix, after: child))
            
        }
        
        return results
    }
    
}





