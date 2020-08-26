//
//  File.swift
//  DataAndAlgorimTotal
//
//  Created by 李玉臣 on 2020/8/26.
//  Copyright © 2020 liyuchen. All rights reserved.
//

import Foundation

class DynamicProgramming {
     static let changes = [25, 20, 5, 1]

    static var dpDic:[Int: Int] = [Int: Int]()
    // coin Change
    static func coinChange(_ num: Int) -> Int{
        if num <= 0 {
            return Int.max
        }

        for change in changes {
            if num == change {
                return 1
            }
        }
        let one = coinChange(num - 25)
        let two = coinChange(num - 20)
        let three = coinChange(num - 5)
        let four = coinChange(num - 1)

        let five = min(one, two)
        let six = min(three, four)

        return  min(five, six) + 1
    }

    static func coinChangeTwo(_ num: Int) -> Int {
        if num <= 0 {
            return Int.max
        }

        for change in changes {
            if change == num {
                return 1
            }
        }

        if dpDic[num - 25] == nil {
            dpDic[num - 25] = coinChange(num - 25)
        }

        if dpDic[num - 20] == nil {
            dpDic[num - 20] = coinChange(num - 20)
        }

        if dpDic[num - 5] == nil {
            dpDic[num - 5] = coinChange(num - 5)
        }

        if dpDic[num - 1] == nil {
            dpDic[num - 1] = coinChange(num - 1)
        }

        let one = dpDic[num - 25] ?? Int.max
        let two = dpDic[num - 20] ?? Int.max
        let three = dpDic[num - 5] ?? Int.max
        let four = dpDic[num - 1] ?? Int.max

        let minOne = min(one, two )
        let minTwo = min(three, four)
        return min(minOne, minTwo) + 1

//        return min(minOne, minTwo) + 1

    }

    static func coinsChangeThree(_ num: Int) -> Int {

        if num <= 0 {
            return Int.max
        }
        var dp = Array.init(repeating: 0, count: num + 1)

        for i in 1...num {
            var minValue = Int.max
            //            dp[index] = min {dp[i-25], dp[i-20], dp[i-5], dp[i-1]} + 1
            if i >= 1 {
                minValue = min(dp[i - 1], minValue)
            }

            if i >= 5  {
                minValue = min(dp[i - 5], minValue)
            }

            if i >= 20 {
                minValue = min(dp[i - 20], minValue)
            }

            if i >= 25 {
                minValue = min(dp[i - 25], minValue)
            }

            dp[i] = minValue + 1
        }

        return dp[num]
    }

    static func coinsChangeThreeTest(_ num: Int) -> Int {

        if num <= 0 {
            return Int.max
        }
        var dp = Array.init(repeating: 0, count: num + 1)

        for i in 1...num {
            var minValue = Int.max

            minValue = min(dp[i - 1], minValue)
            minValue = min(dp[i - 5], minValue)
            minValue = min(dp[i - 20], minValue)
            minValue = min(dp[i - 25], minValue)

            dp[i] = minValue + 1
        }

        return dp[num]
    }
}
