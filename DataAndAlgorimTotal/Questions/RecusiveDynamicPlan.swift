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
        let midValue = array[mid]
        if array[mid] == midValue {
            return mid
        } else if (array[mid] > midValue) {
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
    /*
        左括号：只要左括号还没用完，就可以插入左括号 （
        右括号：如果右括号比左括号少，就可以插入右括号 ）
        只需要记录允许插入的左右括号数目，如果还有左括号可用，就插入一个左括号然后递归。
        如果右括号 比左括号 还多（也就是使用中的左括号比右括号还多），就插入一个右括号然后递归
     */

//    static func addParen(_ list: [String], leftRem: Int, rightRem: Int, str:String, count: Int) {
//        var sList = list
//        if leftRem < 0 || rightRem < leftRem { return }
//
//        if leftRem == 0 && rightRem == 0 {
//            let s = str
//            sList.append(s)
//        }else {
//            if leftRem > 0 {
//                str
//            }
//        }
//    }
    
    //MARK:-- 填充颜色
    
    enum FillColor {
        
        case FBlack,FWhite,FRed,FYellow,FGreen
    }
    
    func paintFill(_ mscreen:[[FillColor]], x: Int, y: Int, ocolor: FillColor, ncolor: FillColor) -> Bool {
        
        var screen = mscreen
        if x < 0 || x >= screen[0].count || y < 0 || y >= screen.count {
            return false
        }
        
        if screen[y][x] == ocolor {
            screen[y][x] = ncolor
            
            _ =  paintFill(screen, x: x - 1, y: y, ocolor: ocolor, ncolor: ncolor) //左
            _ = paintFill(screen, x: x + 1, y: y, ocolor: ocolor, ncolor: ncolor) // 右
            _ = paintFill(screen, x: x, y: y - 1, ocolor: ocolor, ncolor: ncolor) // 上
            _ = paintFill(screen, x: x, y: y + 1 , ocolor: ocolor, ncolor: ncolor) // 下
        }
        return true
    }
    
    func paintFill(_ screen:[[FillColor]], x: Int, y: Int, ncolor: FillColor) -> Bool{
        if screen[y][x] == ncolor {
            return false
        }
        
        return paintFill(screen, x: x, y: y, ocolor: screen[y][x], ncolor: ncolor)
    }
    
    //MARK:-- 使用 币值为25分，10分，5分和1分，编写代码计算n分有几种表示法
    
    
    static func makeChange(_ n: Int, denom: Int) -> Int {
        var next_denom = 0;
        
        switch denom {
        case 25:
            next_denom = 10
        case 10:
            next_denom = 5
        case 5:
            next_denom = 1
        case 1:
            return 1
        default:
            return 1
        }
        
        var ways = 0
        
        var i = 0
        
        while i * denom <= n {
     
            ways += makeChange(n - i * denom, denom: next_denom)
            i += 1
        }
        return ways
    }
    
    
    //MARK:--8皇后
    static let GRID_SIZE = 8
    static func placeQueues(row :Int, column: [Int], results: inout [[Int]]) {
        var mColumn = column
        if row == GRID_SIZE {
            results.append(mColumn)
        }else {
            for col in 0..<GRID_SIZE {
                if checkValid(columns: mColumn, row1: row, column1: col) {
                    mColumn[row] = col
                    placeQueues(row: row + 1, column: mColumn, results: &results)
                }
            }
        }
    }
    
    static func checkValid(columns: [Int], row1: Int, column1: Int) -> Bool {
        for row2 in 0..<row1 {
            let column2 = columns[row2]
            
            /* 检查同一列有无其他 */
            if column1 == column2 {
                return false
            }
            /* 检查对角线:若两列的距离等于两行的距离，就表示在同一对角线上*/
            let columnDistance = abs(column1 - column2)
            let rowDistance = abs(row1 - row2)
            
            if columnDistance == rowDistance {
                return false
            }
        }
        return true
    }
}



















