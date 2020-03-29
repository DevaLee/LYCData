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


    //MARK: -- 在数组A[0...n-1]中，有所谓的魔术索引，满足条件A[i] = i.给定一个有序整数数组，元素值各不相同，编写一个方法，在数组A中找出一个魔术索引，若存在的话

    /*
     [-40, -20, -1, 1, 2, 3, 5, 7, 9, 12, 13]
     */
    static func magicSlow(array: [Int]) -> Int {

        for (i, item) in array.enumerated() {
            if item == i {
                return i
            }
        }
        return -1
    }

    static func magicShowQuick(array: [Int], start: Int, end: Int) -> Int{

        if end < start || start < 0 || end >= array.count {
            return -1
        }

        let mid = (start + end) / 2
        //let midValue = array[mid]
        if array[mid] == mid {
            return mid
        } else if (array[mid] > mid) {
            return magicShowQuick(array: array, start: mid, end: end)
        }else {
            return magicShowQuick(array: array, start: start, end: mid)
        }


    }

    static func magicQuick(array: [Int]) -> Int {

        return magicShowQuick(array: array, start: 0, end: array.count - 1)
    }


    /*
     进阶：如果数组元素有重复值又该如何处理
     */

    /*
     [-10, -5, 2, 2, 2, 3, 4, 7, 9, 12, 13]
       0    1  2  3  4  5  6  7  8  9   10
     */


    static func magicFast(array:[Int], start: Int, end: Int) -> Int {
        if end < start || start < 0 || end > array.count {
            return -1
        }

        let midIndex = (start + end) / 2
        let midValue = array[midIndex]

        if midIndex == midValue {
            return midIndex
        }

        // 搜索左半部分
        let leftIndex = min(midIndex - 1, midValue)

        let left = magicFast(array: array, start: start, end: leftIndex)

        if left >= 0 {
            return left
        }

        /* 搜索右半部分 */
        let rightIndex = max(midIndex + 1 , midValue)
        let right = magicFast(array: array, start: rightIndex, end: end)

        return right
    }


    //MARK: -- 实现一种算法，打印n对括号的全部有效组合（即左右括号正确配对）

    static func addParen(_ list: Array, leftRem: Int, rightRem: Int, str:[Character], count: Int) {
        
    }
}


