//
//  QuickUnion.swift
//  DataAndAlgorimTotal
//
//  Created by 李玉臣 on 2020/8/2.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import UIKit

class QuickUnion: UnionFindProtocol {
    var parents: [Int]

    func find(_ v: Int) -> Int? {
        var index = v
        guard rangeCheck(index) else {
            return nil
        }

        // 根节点： 索引值 = parents[索引值]
        while index != parents[index] {
            index = parents[index] // 去父节点里面去找
        }
        return index
    }

    func union(_ v1: Int, _ v2: Int) {
        let p1 = find(v1)  // 查找 v1 的根节点
        let p2 = find(v2) // 查找 v2 的根节点
        if p1 == p2 { return }

        guard let pOne = p1, let pTwo = p2 else {
            return
        }
        parents[pOne] = pTwo // 将v1 的根节点设置为v2的根节点
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
