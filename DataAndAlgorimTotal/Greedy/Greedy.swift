//
//  Greedy.swift
//  DataAndAlgorimTotal
//
//  Created by 李玉臣 on 2020/8/23.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import Foundation

class Greedy {

    static func bestLoadSolution(_ weights: [Int], _ capacity: Int) -> Int{
        var weightArray = weights
        var count = 0
        var weight = 0
        weightArray.sort() // 将数组从小到大进行排序

        for newWeight in weights {
            // 如果船还可以装入新古董，
            if (newWeight + weight < capacity) {
                weight += newWeight
                count += 1
            }
        }
        return count
    }


    static func coinChange(_ coins: [Int], _ changeNum: Int) -> [Int] {
        var changeCoins = [Int]()
        var exchangeCoin = coins

        var newChangeNum = changeNum

        exchangeCoin.sort { (coin1,coin2 ) -> Bool in // 1
            return coin1 > coin2
        }

        for coin in exchangeCoin { // 2
            while coin <= newChangeNum { // 3
                changeCoins.append(coin)
                newChangeNum -= coin
            }
        }
        return changeCoins
    }
}
