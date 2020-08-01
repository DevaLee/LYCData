//
//  QuickFind.swift
//  DataAndAlgorimTotal
//
//  Created by 李玉臣 on 2020/7/31.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import UIKit



class QuickFind: UnionFindProtocol {
    var parents: [Int]

    // 父节点就是根节点
    func find(_ v: Int) -> Int? {
        guard rangeCheck(v) else {
            return nil
        }

        return parents[v]
    }

    /*
     将v1所在集合的所有元素，都嫁接到v2的父节点上
     */
    func union(_ v1: Int, _ v2: Int) {
        let p1 = find(v1)
        let p2 = find(v2)
        if p1 == p2 {
            return
        }

        // 将 p1 所在集合的里面所有的元素，迁移到 p2 所在集合中
        for(index, item)  in parents.enumerated() {
            if item == p1 {
                parents[index] = p2 ?? -1
            }
        }
    }


    required init(capacity: Int) {
        guard capacity > 0 else {
            parents = [Int]()
            return
        }
        parents = Array(repeating: 0, count: capacity)

        for i in 0..<capacity {
            parents[i] = i
        }
    }

}
