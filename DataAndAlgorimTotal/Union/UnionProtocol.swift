//
//  UnionProtocol.swift
//  DataAndAlgorimTotal
//
//  Created by 李玉臣 on 2020/7/31.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import Foundation

 protocol UnionFindProtocol {
    var parents: [Int] { get set } // 1

    init(capacity: Int) // 2
    // 查找v所属的集合
    func find(_ v: Int) -> Int? // 3
    // 合并 v1、v2所在的集合
    func union(_ v1: Int, _ v2: Int) // 4
    // 是否在同一个集合
    func isSame(_ v1: Int, _ v2: Int) -> Bool // 5

    func rangeCheck(_ i: Int) -> Bool // 6




}

extension UnionFindProtocol {
    func isSame(_ v1: Int, _ v2: Int) -> Bool {

        return find(v1) == find(v2)                 // 7
    }

    func rangeCheck(_ i: Int) -> Bool {
        
        return i < parents.count                    // 8
    }
}
