//
//  RecusiveDynamicPlan.swift
//  DataAndAlgorimTotal
//
//  Created by 李玉臣 on 2020/3/28.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import Foundation
// 递归和动态规划


class RecrusiveDynamicPlan {



    //MARK: -- 有个小孩正在上楼，楼梯有n阶台阶，小孩一次可以上1阶、2阶或3阶。实现一个方法，计算有多少种上楼方式

    // 使用Int有可能会突破int型的上限而溢出，使用long可以撑久一点，但不能从根本上解决问题
    // O(3^N)
    static func countWays(_ n : Int) -> Int {
        if n < 0 {
            return 0
        }else if n == 0 {
            return 1
        } else {

            return countWays(n - 3) + countWays(n - 2) + countWays(n - 1)
        }
    }


    static func countWaysDP(_ n: Int, map: inout [Int]) -> Int{

//        var map = omap
        if n < 0 {
            return 0
        } else if n == 0 {
            return 1
        } else if map[n] > -1 {
            
            return map[n];
        } else {
            map[n] = countWaysDP( n - 1, map: &map) + countWaysDP(n - 2, map: &map) + countWaysDP(n - 3, map: &map)
            return map[n]
        }
    }

}


