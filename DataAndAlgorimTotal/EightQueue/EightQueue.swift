//
//  EightQueue.swift
//  DataAndAlgorimTotal
//
//  Created by 李玉臣 on 2020/8/22.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import Foundation

class Queues {

    var cols:[Int] // 数组索引是行号，数组元素是列号
    var ways: Int = 0 // 一共多少中摆法

    init(_ count: Int) {
        cols = Array.init(repeating: -1, count: count)
    }


    /*
     判断第row行 第 col列是否可以摆放皇后
     */
    func isValid( _ row: Int, _ col: Int) -> Bool {

        for i in 0..<row {
            // 判断第col列有没有摆放皇后
            if cols[i] == col {
                return false
            }
            // 第i行的皇后和第row行第col列格子处在同一斜线上
            if row - i == abs(col-cols[i]) {
                return false
            }
        }
        return true
    }

    func placeQueues(_ n: Int){
        if n < 1 {
            return
        }
        cols = Array.init(repeating: -1, count: n)

        place(0)
    }

    // 摆放第几行
    func place(_ row: Int){
        if row == cols.count {
            ways += 1
            return
        }

        for col in 0..<cols.count {
            if isValid(row, col) {
                print("row: \(row), col: \(col)")
                cols[row] = col
                place(row + 1)
            }
        }
    }

}
